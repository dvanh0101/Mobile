import 'package:flutter/material.dart';

class CustomBottomNavigationBar_Social extends StatelessWidget {
  final Function(int) onItemSelected;
  final int selectedIndex;

  const CustomBottomNavigationBar_Social({
    Key? key,
    required this.onItemSelected,
    required this.selectedIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.pink.shade50, // Màu nền tương tự hình
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildIcon(
            icon: Icons.home,
            index: 0,
          ),
          _buildIcon(
            icon: Icons.search,
            index: 1,
          ),
          _buildIcon(
            icon: Icons.add_circle,
            index: 2,
          ),
          _buildIcon(
            icon: Icons.favorite,
            index: 3,
          ),
          _buildIcon(
            icon: Icons.person,
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildIcon({
    required IconData icon,
    required int index,
  }) {
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        padding: EdgeInsets.all(8), // Thêm padding để tăng vùng nhấn
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: index == selectedIndex
              ? Colors.blue.shade100 // Màu nền khi được chọn
              : Colors.transparent, // Không màu khi không được chọn
        ),
        child: Icon(
          icon,
          color: index == selectedIndex
              ? Colors.blue // Màu biểu tượng khi được chọn
              : Colors.black54, // Màu biểu tượng khi không được chọn
          size: 35, // Kích thước biểu tượng đồng nhất
        ),
      ),
    );
  }
}
