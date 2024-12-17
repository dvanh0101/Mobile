import 'package:flutter/material.dart';

class TestModal_33 extends StatefulWidget {
  const TestModal_33({super.key});

  @override
  State<TestModal_33> createState() => _TestModal_33State();
}

class _TestModal_33State extends State<TestModal_33> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modal Dialog'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _dialeogBuilder(context);
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}

Future<void> _dialeogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    useSafeArea: true,
    builder: (BuildContext context) {
      return Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text('Yêu cầu hẹn xem phòng',
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Danh sách hẹn lịch xem phòng (1/100)',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 0, 0, 0),
                    decoration: TextDecoration.none,
                  )),
            ),
            ListView(
              shrinkWrap: true,
              children: [
                _buildDialog('Nguyễn Văn A', 'Đã xem phòng, đồng ý thuê phòng',
                    'assets/images/image.png'),
                _buildDialog('Nguyễn Văn B', 'Đã xem phòng, đồng ý thuê phòng',
                    'assets/images/image.png'),
                _buildDialog('Nguyễn Văn C', 'Đã xem phòng, đồng ý thuê phòng',
                    'assets/images/image.png'),
              ],
            ),
          ],
        ),
      );
    },
  );
}

Widget _buildDialog(String title, String content, String image) {
  return Container(
    margin: const EdgeInsets.only(bottom: 10),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 210, 210, 210),
      borderRadius: BorderRadius.circular(10),
    ),
    padding: const EdgeInsets.all(10),
    child: Row(
      children: [
        Image.asset(image),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(title,
                softWrap: true,
                style: const TextStyle(
                    fontSize: 14,
                    decoration: TextDecoration.none,
                    color: Color(0xFFF11F1F))),
            const SizedBox(height: 5),
            SizedBox(
              width: 250,
              child: Text(content,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                  style: const TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      color: Colors.black)),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 80),
              child: Row(
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                      backgroundColor: const Color(0xFF50A99A),
                    ),
                    onPressed: () {},
                    child: const Text('Duyệt yêu cầu',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        )),
                  ),
                  const SizedBox(width: 10),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                      backgroundColor: const Color(0xFF50A99A),
                    ),
                    onPressed: () {},
                    child: const Text('Xem thông tin',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        )),
                  ),
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
