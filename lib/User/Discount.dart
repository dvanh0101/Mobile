import 'package:flutter/material.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/AppBar.dart';
import 'package:student_lite/widgets/fab.dart';

class Discount extends StatefulWidget {
  const Discount({super.key});

  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
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
              'Giảm giá 50%',
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,155,0),
        child:
        fab(),
      ),
      bottomSheet: Stack(
        children: [
          MyHomePage(searchQuery: 'widget.searchQuery',),
        ],
      ),
    );
  }

  Widget _child(int index) {
    return SizedBox(
      height: _itemHeight,
      child: ListTile(
        leading: Image.asset(
          'assets/image2.png',
          width: _itemHeight,
          height: _itemHeight,
          fit: BoxFit.cover,
        ),
        title: Text('Phòng trọ Minh An'),
        subtitle: Text('Quận 5, TP.HCM'),
        trailing: Icon(
          Icons.favorite,
          size: 20,
        ),
      ),
    );
  }
}
