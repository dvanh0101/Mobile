import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:student_lite/Home/post-new-room-88.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/fab.dart';
import 'package:student_lite/Model/Phong.dart';
import 'package:student_lite/Network/network_requets.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class post extends StatefulWidget {


  const post({super.key});

  @override
  _postState createState() => _postState();
}

class _postState extends State<post> {
  List<Phong> posts = []; // Add a list to hold the posts

  @override
  void initState() {
    super.initState();
    _loadData(); // Load the data when the widget initializes
  }

  Future<void> _loadData() async {
    // Simulate loading data (you can replace this with a network request)
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      // Simulating an empty list, you can replace this with actual network data
      posts = []; // Update this to your actual data fetching logic
    });
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
              'Bài đăng của chủ trọ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
            height: 1,
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
            height: 10.0,
          ),
          // Show data if available, otherwise show a no data message
          Expanded(
            child: posts.isEmpty
                ? _buildNoDataView()
                : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return _buildFavoriteItem(posts[index]);
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 155, 0),
        child: fab(),
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
          ],
        ),
      ),
    );
  }

  Widget _buildNoDataView() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(60.0,0,0,0),
      child: Column(
        children: [
          Text('Hiện tại trang của bạn chưa có bài đăng.',
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoomForm()),
              );
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(110, 50),
              shape: RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(8),
              ),
              backgroundColor: StyleConfigColor.keppel,
              foregroundColor: StyleConfigColor.secondaryLight5,
            ),
            child: const Text('Đăng tin'),
          ),
        ],
      ),
    );
  }
}

