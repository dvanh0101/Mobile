import 'package:flutter/material.dart';

class NotiRoomBox {
  static Widget notiRoomBox(
      String image, String title, String price, String address) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Color(0xffE5E5E5)),
            left: BorderSide(width: 1, color: Color(0xffE5E5E5)),
            right: BorderSide(width: 1, color: Color(0xffE5E5E5)),
            bottom: BorderSide(width: 1, color: Color(0xffE5E5E5)),
          )),
      height: 210,
      width: 143,
      padding: const EdgeInsets.all(10),
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        alignment: Alignment.centerLeft,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  image,
                  width: 120,
                  height: 100,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(45, 15),
                  backgroundColor: const Color(0xffF86513),
                ),
                child: const Text('Đối tác',
                    style: TextStyle(fontSize: 10, color: Colors.black)),
              ),
              Text(title, style: const TextStyle(fontSize: 10)),
              Text(price,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/Icon.png',
                    width: 10,
                    height: 10,
                  ),
                  const SizedBox(width: 5),
                  Text(address, style: const TextStyle(fontSize: 10)),
                ],
              ),
            ],
          ),
          Positioned(
            top: 80,
            right: 10,
            child: Image.asset(
              'assets/icons/icon_heart.png',
              width: 17.72,
              height: 15.19,
            ),
          ),
        ],
      ),
    );
  }
}
