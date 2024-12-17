import 'package:flutter/material.dart';
import 'package:student_lite/Model/Phong.dart';
import 'package:student_lite/Network/network_requets.dart';
import 'package:student_lite/Home/28.dart';
import 'package:intl/intl.dart';
class TabHome extends StatefulWidget {
  final String searchQuery;

  const TabHome({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with TickerProviderStateMixin {
  List<String> suggestions = ['Tất cả', 'Mới nhất', 'Cũ nhất'];
  String? selectedOption;
  List<Phong> phongData = [];
  List<Phong> filteredPhongData = [];
  bool isLoading = true;
  String? errorMessage;
  bool isIconRed = false;
  List<Phong> favoriteList = [];
  String? selectedProvince;
  List<Phong> phongList = [];
  List<Phong> filteredList = [];
  String? selectedDistrict;

  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    selectedOption = suggestions.first;
    _fetchData();
    fetchPhong();
  }
  @override
  void didUpdateWidget(covariant TabHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.searchQuery != oldWidget.searchQuery) {
      _filterData(widget.searchQuery);
    }
  }
  Future<void> _fetchData() async {
    try {
      final data = await NetworkRequets.fetchPhong();
      setState(() {
        phongData = data;
        _filterData(widget.searchQuery);
        filteredPhongData = List.from(data);
        isLoading = false;
      });
      _filterData(widget.searchQuery);
    } catch (e) {
      setState(() {
        isLoading = false;
        errorMessage = 'Không tải được dữ liệu';
      });
    }
  }

  void _filterData(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredPhongData = List.from(phongData);
      } else {
        filteredPhongData = phongData.where((phong) {
          final address = phong.address?.toLowerCase() ?? '';
          final name = phong.name?.toLowerCase() ?? '';
          return address.contains(query.toLowerCase()) || name.contains(query.toLowerCase());
        }).toList();
      }

      if (selectedOption == 'Tất cả') {
      } else if (selectedOption == 'Mới nhất') {
        filteredPhongData.sort((a, b) {
          final dateA = DateTime.tryParse(a.createAt?.date ?? '');
          final dateB = DateTime.tryParse(b.createAt?.date ?? '');
          return dateB?.compareTo(dateA ?? DateTime(0)) ?? 0;
        });
      } else if (selectedOption == 'Cũ nhất') {
        filteredPhongData.sort((a, b) {
          final dateA = DateTime.tryParse(a.createAt?.date ?? '');
          final dateB = DateTime.tryParse(b.createAt?.date ?? '');
          return dateA?.compareTo(dateB ?? DateTime(0)) ?? 0;
        });
      }
      if (selectedProvince != null && selectedProvince!.isNotEmpty) {
        filteredPhongData = filterByProvince(filteredPhongData, selectedProvince!);
      }
      if (selectedDistrict != null && selectedDistrict!.isNotEmpty) {
        filteredPhongData = filterByDistrict(filteredPhongData, selectedDistrict!);
      }
    });
  }
  String getProvince(String address) {
    final parts = address.split(',').map((e) => e.trim()).toList();
    return parts.length > 1 ? parts.last : '';
  }

  Set<String> getProvinces(List<Phong> phongList) {
    return phongList.map((phong) {
      final addressParts = (phong.address ?? '').split(',').map((e) => e.trim()).toList();
      return addressParts.isNotEmpty ? addressParts.last : '';
    }).toSet();
  }
  List<Phong> filterByProvince(List<Phong> phongList, String selectedProvince) {
    return phongList.where((phong) => getProvince(phong.address ?? '') == selectedProvince).toList();
  }
  String getDistrict(String address) {
    final parts = address.split(',').map((e) => e.trim()).toList();
    return parts.length > 1 ? parts[parts.length - 2] : '';
  }
  Set<String> getDistricts(List<Phong> phongList, String selectedProvince) {
    return phongList
        .where((phong) => getProvince(phong.address ?? '') == selectedProvince)
        .map((phong) {
      final addressParts = (phong.address ?? '').split(',').map((e) => e.trim()).toList();
      return addressParts.length > 1 ? addressParts[addressParts.length - 2] : ''; // Extract district
    }).toSet();
  }
  List<Phong> filterByDistrict(List<Phong> phongList, String selectedDistrict) {
    return phongList.where((phong) => getDistrict(phong.address ?? '') == selectedDistrict).toList();
  }
  void fetchPhong() async {
    try {
      final List<Phong> fetchedList = await NetworkRequets.fetchPhong();
      setState(() {
        phongList = fetchedList;
        filteredList = phongList;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final provinces = getProvinces(phongList).toList();
    return Material(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on),
                  const Flexible(child: Text('Khu Vực : ')),
                  Container(
                    width: 200.0,
                    child: DropdownButton<String>(
                      hint: const Text('Chọn Tỉnh/Thành Phố'),
                      value: selectedProvince,
                      items: provinces.map((province) {
                        return DropdownMenuItem<String>(
                          value: province,
                          child: Text(province),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedProvince = value;
                          selectedDistrict = null;
                          _filterData(widget.searchQuery);
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              if(selectedProvince != null)
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: 600.0,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: List.generate(getDistricts(phongList, selectedProvince!).length, (index) {
                              final district = getDistricts(phongList, selectedProvince!).toList()[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedDistrict = district;
                                    _filterData(widget.searchQuery);
                                  });
                                },
                                child: Container(
                                  width: 100.0,
                                  height: 50.0,
                                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    border: Border.all(
                                      color: selectedDistrict == district ? Colors.orange : Colors.black,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      district,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Container(
                alignment: AlignmentDirectional.centerStart,
                width: 260.0,
                child: TabBar(
                  controller: _tabController,
                  tabs: [
                    Tab(text: "Tất cả"),
                    Tab(text: "Cá nhân"),
                    Tab(text: "Môi giới"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                width: 100.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: InputDecorator(
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: DropdownButton<String>(
                    value: selectedOption,
                    isExpanded: true,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedOption = newValue;
                        _filterData(widget.searchQuery);
                      });
                    },
                    items: suggestions.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildContentView(),
                Center(child: Text("Cá nhân")),
                Center(child: Text("Môi giới")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentView() {
    if (isLoading) {
      return Center(child: CircularProgressIndicator());
    }

    if (errorMessage != null) {
      return _buildErrorView();
    }

    if (filteredPhongData.isEmpty) {
      return _buildNoDataView();
    }

    return ListView.builder(
      itemCount: filteredPhongData.length,
      itemBuilder: (context, index) {
        final phong = filteredPhongData[index];
        return _buildPhongItem(phong);
      },
    );
  }

  Widget _buildErrorView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage!,
            style: TextStyle(fontSize: 18, color: Colors.red),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: _fetchData,
            child: Text('Tải lại'),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataView() {
    return Center(
      child: Text(
        'Không tìm thấy dữ liệu',
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }

  Widget _buildPhongItem(Phong phong) {
    bool isFavorite = NetworkRequets.isFavorite(phong.iId?.oid ?? "");
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      },
      child: Card(
        elevation: 3,
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Column(
                children: [
                  if (phong.attachments != null && phong.attachments!.isNotEmpty)
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: 100,
                      margin: EdgeInsets.only(right: 10),
                      child: Image.network(
                        phong.attachments![0],
                        fit: BoxFit.cover,
                      ),
                    ),
                  if (phong.attachments == null || phong.attachments!.isEmpty)
                    Text(
                      'No image available',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                ],
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      phong.name ?? "No Name",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      phong.acreage != null ? "${phong.acreage} m²" : "No Area Info",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 5),
                    Text(
                      phong.price != null
                          ? NumberFormat.currency(locale: 'vi_VN', symbol: 'Đ/Tháng').format(phong.price)
                          : "No price",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      phong.address ?? "No Address",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isFavorite) {
                            favoriteList.remove(phong);
                          } else {
                            favoriteList.add(phong);
                          }
                        });
                        NetworkRequets.saveFavoriteStatus(phong.iId?.oid ?? "", !isFavorite);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
