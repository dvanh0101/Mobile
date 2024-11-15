import 'package:flutter/material.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';

class TabHome extends StatefulWidget {
  @override
  _TabHomeState createState() => _TabHomeState();
}

class _TabHomeState extends State<TabHome> with TickerProviderStateMixin{
  List<String> suggestions = ['anhdeptrai', 'cute', 'handsome'];
  String? selectedOption;

  static const double _itemHeight = 100;
  static const int _itemCount = 100;

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Column(
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
                  Tab(text: "Mô giới"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
              width: 100.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                // border: Border.all(color: Colors.yellow),
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
        Container(
          width: double.maxFinite,
          height: 350.0,
          child: TabBarView(
            controller: _tabController,
              children: [
                Container(
                  // height: 400,
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
                Text("12"),
                Text("12"),
              ],
          ),
        ),
      ],
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