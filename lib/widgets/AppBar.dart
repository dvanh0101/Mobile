import 'package:flutter/material.dart';
import 'package:student_lite/Home/Home.dart';
import 'package:student_lite/Home/Tab_Home.dart';
import 'package:student_lite/Home/ui_user_65.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Function(String) onSearchSubmitted;

  CustomAppBar({Key? key, required this.onSearchSubmitted})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 2),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Student Lite',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32.0,
        ),
      ),
      centerTitle: true,
      flexibleSpace: Column(
        children: [
          SizedBox(height: 90.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    onSubmitted: (query) {
                      if (query.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(searchQuery: query),
                          ),
                        );
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UiUser65(),
                    ),
                  );},
                ),
                IconButton(
                  icon: Icon(Icons.grid_view),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
