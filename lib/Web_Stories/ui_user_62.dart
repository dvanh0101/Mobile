import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';
import 'package:flutter/material.dart';
import 'package:student_lite/widgets/appbar_sp.dart';
import 'package:student_lite/widgets/buildEmptyState.dart';
import 'package:student_lite/widgets/input_box.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/fab.dart';

class UiUser62 extends StatefulWidget {
  const UiUser62({Key? key}) : super(key: key);

  @override
  _UiUser62State createState() => _UiUser62State();
}

class _UiUser62State extends State<UiUser62>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // For the 4 tabs
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController _controller = TextEditingController();
    String? dropdownValue = 'Cho Thuê';
    return Scaffold(
        appBar: AppbarSp(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: StyleConfigColor.text2Dark8, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(8.0), // Rounded corners
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: DropdownButton<String>(
                        value: dropdownValue,
                        items: <String>['Cho Thuê', 'Mua Bán', 'Tìm kiếm']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        },
                        underline: SizedBox(), // Remove underline
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: InputBox.inputDecoration(
                          'Search...',
                          _controller,
                          Icon(Icons.search),
                        ),
                      ),
                    ),
                    const SizedBox(
                        width: 8), // Khoảng cách giữa InputBox và icon đầu tiên
                    // Two icons next to the input box
                    IconButton(
                      icon: Image.asset('assets/images/chat_all.png'),
                      onPressed: () {
                        // Hành động khi nhấn icon chat
                      },
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: Icon(Icons.grid_view),
                      onPressed: () {
                        // Hành động khi nhấn icon grid
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: StyleConfigColor.succeed,
                      child: Text(
                        'K',
                        style: StyleConfigText.title4,
                      ),
                      radius: 24,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tạ Minh Khôi',
                          style: StyleConfigText.bodyTextBlack3,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Handle "Tạo đối tác" action
                          },
                          child: Text(
                            '+ Tạo đối tác',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.blue,
                tabs: [
                  Tab(
                    text: 'Đang hiển thị (0)',
                  ),
                  Tab(
                    text: 'Hết hạn (0)',
                  ),
                  Tab(
                    text: 'Bị từ chối (0)',
                  ),
                  Tab(
                    text: 'Tin nháp (0)',
                  ),
                ],
              ),
              SizedBox(
                height: 300, // Set a fixed height for the tab content
                child: TabBarView(controller: _tabController, children: [
                  Buildemptystate.buildEmptyState(),
                  Buildemptystate.buildEmptyState(),
                  Buildemptystate.buildEmptyState(),
                  Buildemptystate.buildEmptyState(),
                ]),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'CyberSkill',
                        style: StyleConfigText.bodyTextSemiBold1
                            .copyWith(color: StyleConfigColor.notice),
                      ),
                      Text(
                        'Tìm kiếm bất động sản trên ứng dụng Student Life',
                        style: StyleConfigText.bodyTextSemiBold3,
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Center align the row
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: StyleConfigColor
                                        .text2Dark8, // Border color
                                    width: 1.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Rounded corners
                                ),
                                padding: EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/apple.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Download on the',
                                          style: StyleConfigText.bodyTextRegular3,
                                        ),
                                        Text(
                                          'App Store',
                                          style: StyleConfigText.bodyTextSemiBold2,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center, // Center align the row
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: StyleConfigColor
                                        .text2Dark8, // Border color
                                    width: 1.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Rounded corners
                                ),
                                padding: EdgeInsets.all(3.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/googleplay.png',
                                      width: 35,
                                      height: 35,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Android app on',
                                          style: StyleConfigText.bodyTextRegular3,
                                        ),
                                        Text(
                                          'Google play',
                                          style: StyleConfigText.bodyTextSemiBold2,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,155,0),
        child:
        fab(),
      ),
      bottomSheet: Stack(
        children: [
          MyHomePage(searchQuery: 'searchQuery',),
        ],
      ),
    );
  }
}
