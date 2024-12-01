import 'package:flutter/material.dart';
import 'dart:math';

import 'package:student_lite/utils/config-color.dart';

class BubbleMenu extends StatefulWidget {
  final double radius;
  final double bubbleSize;
  final double animationDuration;

  const BubbleMenu({
    Key? key,
    this.radius = 100,
    this.bubbleSize = 64,
    this.animationDuration = 200,
  }) : super(key: key);

  @override
  _BubbleMenuState createState() => _BubbleMenuState();
}

class _BubbleMenuState extends State<BubbleMenu> {
  Offset position = Offset(0, 100); // Vị trí ban đầu của menu
  Offset initialPosition = Offset(0, 100); // Vị trí ban đầu khi bắt đầu kéo
  bool showOptions = false; // Trạng thái hiển thị các hình tròn
  bool isDragging = false; // Kiểm tra kéo

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // Tính toán vị trí trung tâm của menu
    double centerX = position.dx + widget.bubbleSize / 2;
    double centerY = position.dy + widget.bubbleSize / 2;
    Offset center = Offset(centerX, centerY);  // Trung tâm của menu

    return Stack(
      children: [
        // Menu chính
        AnimatedPositioned(
          duration: isDragging
              ? Duration(milliseconds: 0)
              : Duration(milliseconds: widget.animationDuration.toInt()),
          top: position.dy,
          left: position.dx,
          child: GestureDetector(
            onPanStart: (details) {
              // Lưu vị trí ban đầu khi bắt đầu kéo
              initialPosition = position;
            },
            onPanUpdate: (details) {
              setState(() {
                isDragging = true;
                // Cập nhật vị trí menu dựa trên sự thay đổi vị trí từ khi bắt đầu kéo
                position = Offset(
                  initialPosition.dx + details.localPosition.dx,
                  initialPosition.dy + details.localPosition.dy,
                );
                // Giới hạn vị trí menu không vượt qua màn hình
                position = Offset(
                  position.dx.clamp(0, screenWidth - widget.bubbleSize),
                  position.dy.clamp(0, screenHeight - widget.bubbleSize),
                );
              });
            },
            onPanEnd: (_) {
              setState(() {
                isDragging = false;
                // Khi kéo kết thúc, menu sẽ di chuyển về vị trí hợp lý
                position = position.dx > screenWidth / 2
                    ? Offset(screenWidth - widget.bubbleSize, position.dy)
                    : Offset(0, position.dy);
              });
            },
            onTap: () {
              setState(() {
                showOptions = !showOptions;
              });
            },
            child: Container(
              width: widget.bubbleSize,
              height: widget.bubbleSize,
              decoration: BoxDecoration(
                color: StyleConfigColor.text2,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Container(
                width: widget.bubbleSize,
                height: widget.bubbleSize,
                decoration: BoxDecoration(
                  color: StyleConfigColor.text2,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: ClipOval(
                  child: Transform.scale(
                    scale: 0.5,
                    child: Image.asset(
                      'assets/images/bubble-menu.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Hiển thị các tùy chọn xung quanh menu
        if (showOptions) ...[
          if (position.dx > screenWidth / 2) ...[
            _buildOptionAtAngle(center, 3 * pi / 2, 'assets/images/chat.png', 'Tùy chọn 1', StyleConfigColor.text2),
            _buildOptionAtAngle(center, 5 * pi / 4, 'assets/images/chat-sms.png', 'Tùy chọn 2', StyleConfigColor.text2),
            _buildOptionAtAngle(center, pi, 'assets/images/telephone-call.png', 'Tùy chọn 3', StyleConfigColor.text2),
          ] else ...[
            _buildOptionAtAngle(center, -2.8 / 2, 'assets/images/chat.png', 'Tùy chọn 1', StyleConfigColor.text2),
            _buildOptionAtAngle(center, (-sqrt(2) + 0.1) / 2, 'assets/images/chat-sms.png', 'Tùy chọn 2', StyleConfigColor.text2),
            _buildOptionAtAngle(center, 0.1, 'assets/images/telephone-call.png', 'Tùy chọn 3', StyleConfigColor.text2),
          ],
        ],
      ],
    );
  }

  Widget _buildOptionAtAngle(
      Offset center,
      double angle,
      String imagePath,
      String label,
      Color color,
      ) {
    return Positioned(
      top: center.dy + widget.radius * sin(angle) - widget.bubbleSize / 2,  // Điều chỉnh lại cho đúng vị trí
      left: center.dx + widget.radius * cos(angle) - widget.bubbleSize / 2,  // Điều chỉnh lại cho đúng vị trí
      child: GestureDetector(
        onTap: () {
          print('Bạn đã chọn $label');
          setState(() {
            showOptions = false; // Ẩn menu khi chọn
          });
        },
        child: Container(
          padding: const EdgeInsets.all(0),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 8,
              ),
            ],
          ),
          child: ClipOval(
            child: Transform.scale(
              scale: 0.6,
              child: Image.asset(
                imagePath,
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
