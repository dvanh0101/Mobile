import 'package:flutter/material.dart';

class NotiDiscountRoomBox {
  static Widget notiDiscountRoomBox(String image, String title, String price,
      String address, String persentDiscount) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 1, color: Color(0xffE5E5E5)),
            bottom: BorderSide(width: 1, color: Color(0xffE5E5E5)),
          )),
      height: 150,
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Stack(children: [
            Image.asset(
              image,
              width: 120,
              height: 100,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(45, 15),
                  backgroundColor: const Color(0xffF86513),
                ),
                child: Text(persentDiscount,
                    style: const TextStyle(fontSize: 10, color: Colors.black)),
              ),
            ),
          ]),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(title,
                    style: const TextStyle(fontSize: 10, color: Colors.black)),
              ),
              // Text(title, style: const TextStyle(fontSize: 10)),
              Text(price,
                  style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.red)),
              Container(
                padding: const EdgeInsets.all(5),
                width: 60,
                child: const Row(
                  children: [
                    Icon(Icons.message_rounded, size: 10),
                    Text('Chat',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF0AB930))),
                  ],
                ),
              ),
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
