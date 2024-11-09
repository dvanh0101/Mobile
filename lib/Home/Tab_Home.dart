import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> {
  List<String> suggestions = ['anhdeptrai', 'cute', 'handsome'];
  String? selectedOption;

  static const double _itemHeight = 100;
  static const int _itemCount = 100;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Container(
          margin: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),

          child: ContainedTabBarView(

            tabs: [
              Text('Tất cả'),
              Text('Cá nhân'),
              Text('Mô giới'),
            ],
            tabBarProperties: TabBarProperties(
              width: 200,
              background: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
              ),
              alignment: TabBarAlignment.start,
            ),
            views: [
              Container(
                height: 400,
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
                color: Colors.white,
              ),
              Container(color: Colors.white),
              Container(color: Colors.white),
            ],
            onChange: (index) => print(index),
          ),
        ),
      ),
    );
  }

  Widget _child(int index) {
    return SizedBox(
      height: _itemHeight,
      child: ListTile(
        leading: Image.asset(
          'assets/avt.jpg',
          // width: _itemHeight,
          // height: _itemHeight,
          // fit: BoxFit.cover,
        ),
        title: Text('test'),
        subtitle: Text('test'),
        trailing: Icon(
          Icons.heart_broken_outlined,
          size: 10,
        ),
      ),
    );
  }
}
