import 'package:flutter/material.dart';
import 'package:student_lite/widgets/AppBar.dart';

class SavePost extends StatefulWidget {
  const SavePost({super.key});

  @override
  _SavePostState createState() => _SavePostState();
}

class _SavePostState extends State<SavePost> {
  static const double _itemHeight = 100;
  static const int _itemCount = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(onSearchSubmitted: (String ) {  },),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tin đăng đã lưu (3/100)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
            height: 1,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _itemCount,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print("onItemTapCallback index: $index");
                  },
                  child: _child(index),
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
    );
  }

  Widget _child(int index) {
    return SizedBox(
      height: _itemHeight,
      child: ListTile(
        leading: Image.asset(
          'assets/avt.jpg',
          width: _itemHeight,
          height: _itemHeight,
          fit: BoxFit.cover,
        ),
        title: Text('test'),
        subtitle: Text('test'),
        trailing: Icon(
          Icons.heart_broken_outlined,
          size: 20,
        ),
      ),
    );
  }
}
