import 'package:flutter/material.dart';

class CommentValuation extends StatefulWidget {
  const CommentValuation({super.key});

  @override
  State<CommentValuation> createState() => _CommentValuationState();
}

List<String> _list = [
  'Mới nhất',
  'Cao nhất',
  'Thấp nhất',
];

class _CommentValuationState extends State<CommentValuation> {
  String currentOption = _list[0];
  int _selectedValue = 0;
  late final int rating = 0;
  late final int maxRating = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        scrolledUnderElevation: 7,
        elevation: 7,
        title: const Text('Student Life',
            style: TextStyle(
              fontSize: 32,
            ),
            textAlign: TextAlign.right),
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsets.all(2.67),
            icon: Image.asset('assets/icons/menu_icon.png',
                width: 26.67, height: 26.67),
            onPressed: () {},
          ),
        ],
        leading: IconButton(
          padding: const EdgeInsets.all(2.67),
          icon:
              Image.asset('assets/icons/Icon.png', width: 21.82, height: 21.82),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Bài đánh giá',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const Text('Xắp xếp theo:', style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildButton(1, "Mới nhất"),
                const SizedBox(height: 10),
                _buildButton(2, "Cao nhất"),
                const SizedBox(height: 10),
                _buildButton(3, "Thấp nhất"),
              ],
            ),
            const SizedBox(height: 10),
            _buildComment(
                'assets/images/avatar.png',
                'Nguyễn Văn A',
                'Phòng trọ ở đây mình đã thuê ở được 1 tháng rồi ạ. Vật dụng nội thất y như mô tả. Anh chủ tư vấn rất nhiệt tình. Cực kì yêu thích trọ ở đây luôn ạ!',
                '2 giờ trước',
                'Mới'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(int value, String text) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedValue = value;
        });
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: _selectedValue == value ? Colors.blue : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        children: [
          _selectedValue == value
              ? const Icon(
                  Icons.check,
                  size: 18,
                )
              : const SizedBox(
                  width: 5,
                ),
          const SizedBox(width: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 16.0),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }

  Widget _buildComment(
      String avatar, String name, String content, String time, String status) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFEFEFEF),
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(avatar),
              ),
              const SizedBox(width: 10),
              Text(name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(maxRating, (index) {
                  return Icon(
                    index < rating ? Icons.star_border : Icons.star,
                    color: Colors.yellow,
                  );
                }),
              ),
              const SizedBox(width: 10),
              Text(time),
              const SizedBox(width: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF91A1D0),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(status,
                    style: const TextStyle(color: Colors.white, fontSize: 14)),
              ),
            ],
          ),
          Text(
            content,
            style: const TextStyle(fontSize: 14, color: Colors.black),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              Icon(Icons.favorite),
              SizedBox(width: 10),
              Icon(Icons.comment),
              SizedBox(width: 10),
              Icon(Icons.share),
            ],
          ),
        ],
      ),
    );
  }
}
