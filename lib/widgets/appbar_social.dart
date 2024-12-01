import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';

class AppbarSocial extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  AppbarSocial({Key? key})
      : preferredSize = const Size.fromHeight(200),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: Colors.white,
          title: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/images/IconBar.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // Căn chỉnh từ trên xuống
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name",
                              style: StyleConfigText.bodyTextSemiBold1,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Bạn đang nghĩ gì?",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                filled: true,
                                fillColor: Colors.grey[200],
                              ),
                            ),
                            const Row(
                              children: [
                                Icon(Icons.image),
                                SizedBox(width: 10),
                                Icon(Icons.camera),
                                SizedBox(width: 10),
                                Icon(Icons.mic),
                                SizedBox(width: 10),
                                Icon(Icons.location_city),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
