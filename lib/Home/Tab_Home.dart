import 'package:flutter/material.dart';
import 'package:student_lite/Model/Phong.dart';
import 'package:student_lite/Network/network_requets.dart';
import 'package:student_lite/screens/28.dart';
class TabHome extends StatefulWidget {
  final String searchQuery;

  const TabHome({Key? key, required this.searchQuery}) : super(key: key);

  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with TickerProviderStateMixin {
  List<String> suggestions = ['anhdeptrai', 'cute', 'handsome'];
  String? selectedOption;
  List<Phong> phongData = [];
  List<Phong> filteredPhongData = [];
  bool isLoading = true;
  String? errorMessage;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _fetchData();
  }

  Future<void> _fetchData() async {
    try {
      final data = await NetworkRequets.fetchPhong();
      setState(() {
        phongData = data;
        _filterData(widget.searchQuery);
        isLoading = false;
      });
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
        filteredPhongData = phongData;
      } else {
        filteredPhongData = phongData.where((phong) {
          final address = phong.address?.toLowerCase() ?? '';
          final name = phong.name?.toLowerCase() ?? '';
          return address.contains(query.toLowerCase()) || name.contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                alignment: AlignmentDirectional.centerStart,
                width: 270.0,
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                phong.address ?? "No Address",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                phong.acreage != null ? "${phong.acreage} m²" : "No Area Info",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 5),
              Text(
                phong.name ?? "No Name",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
