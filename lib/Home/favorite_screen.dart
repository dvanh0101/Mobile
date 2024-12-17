import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            'assets/images/Uwarp.png',
            alignment: Alignment.center,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 39),
          child: Text('Hoạt Động',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _childMenu('Tất cả'),
              _childMenu('Theo dõi'),
              _childMenu('Yêu thích'),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffB3B3B3), width: 1),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(10),
          child: const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.verified_user, size: 40),
                      SizedBox(width: 10),
                      Column(
                        children: [
                          Text('Name', style: TextStyle(fontSize: 12)),
                          Text(
                            '12 hour',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.more_horiz,
                        size: 11,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.close,
                        size: 11,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 57),
                child: Column(
                  children: [
                    Text('Tìm trọ giá rẻ giành cho sinh viên', style: TextStyle(fontSize: 10)),
                    Row(
                      children: [
                        
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ));
  }

  Widget _childMenu(String title) {
    return Container(
      width: 99,
      height: 31,
      decoration: BoxDecoration(
        color: const Color(0xffF3E7C6),
        borderRadius: BorderRadius.circular(45),
      ),
      alignment: Alignment.center,
      child: Text(title,
          textAlign: TextAlign.center, style: const TextStyle(fontSize: 14)),
    );
  }
}
