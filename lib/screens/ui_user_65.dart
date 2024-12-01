import "package:flutter/material.dart";
import "package:student_lite/utils/config-color.dart";
import "package:student_lite/utils/config-text.dart";
import "package:student_lite/widgets/appbar_sp.dart";
import "package:student_lite/widgets/input_box.dart";


class UiUser65 extends StatefulWidget {
  const UiUser65({Key? key}) : super(key: key);

  @override
  _UiUser65State createState() => _UiUser65State();
}

class _UiUser65State extends State<UiUser65> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarSp(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: InputBox.inputDecoration(
                      'Search...',
                      _controller,
                      Icon(Icons.search),
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
              )),
          Image.asset(
            'assets/images/no_message.png',
            height: 200,
          ),
          const SizedBox(height: 20),
          const Text(
            'Bạn chưa có cuộc trò chuyện nào!',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Trải nghiệm chat để làm rõ thông tin về nhà hay phòng trọ trước khi bắt đầu thực hiện mua hoặc thuê.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Về trang chủ'),
            style: ElevatedButton.styleFrom(
              backgroundColor: StyleConfigColor.succeed,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              textStyle: StyleConfigText.bodyTextBlack3,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Hành động khi nhấn FloatingActionButton
        },
        child: Icon(Icons.add), // Bạn có thể thay bằng icon hoặc widget tùy ý
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottomNavigationBar: MyHomePage(title: title),
    );
  }
}
