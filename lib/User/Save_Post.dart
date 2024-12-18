import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/fab.dart';
import 'package:student_lite/Model/Phong.dart';
import 'package:student_lite/Network/network_requets.dart';

class SavePost extends StatefulWidget {
  final List<Phong> favoriteList;

  const SavePost({super.key, required this.favoriteList});

  @override
  _SavePostState createState() => _SavePostState();
}

class _SavePostState extends State<SavePost> {
  static const double _itemHeight = 100;
  List<Phong> favoriteList = [];

  @override
  void initState() {
    super.initState();
    _loadSavedItems();
  }
  Future<void> _loadSavedItems() async {
    try {
      final data = await NetworkRequets.fetchPhong();
      setState(() {
        favoriteList = data.where((phong) {
          return NetworkRequets.isFavorite(phong.iId?.oid ?? "");
        }).toList();
      });
    } catch (e) {
      print("Failed to load saved items: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onSearchSubmitted: (String query) {}),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tin đăng đã lưu (${favoriteList.length}/100)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
            height: 1,
          ),
          Expanded(
            child: favoriteList.isEmpty
                ? _buildNoDataView()
                : ListView.builder(
                  itemCount: favoriteList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print("Item tapped: ${favoriteList[index].name}");
                      },
                      child: _buildFavoriteItem(favoriteList[index]),
                    );
                  },
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
            height: 10.0,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,155,0),
        child:
        fab(),
      ),
      bottomSheet: Stack(
        children: [
          MyHomePage(searchQuery: 'searchQuery'),
        ],
      ),
    );
  }
  Widget _buildFavoriteItem(Phong phong) {
    bool isFavorite = NetworkRequets.isFavorite(phong.iId?.oid ?? "");

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Hình ảnh
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
            // Nội dung: tên, diện tích, giá, địa chỉ
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
            // Biểu tượng yêu thích
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
    );
  }

  Widget _buildNoDataView() {
    return Center(
      child: Text('Không có dữ liệu yêu thích.', style: TextStyle(fontSize: 16, color: Colors.grey)),
    );
  }
}
