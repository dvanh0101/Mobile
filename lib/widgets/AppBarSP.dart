import 'package:flutter/material.dart';

class CustomAppBarSP extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBarSP({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight * 2),
        super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_circle_left_outlined),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: const Text(
        'Student Lite',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 32.0,
        ),
      ),
      centerTitle: true,
      flexibleSpace: Column(
        mainAxisAlignment: MainAxisAlignment.end, // Đẩy nội dung xuống dưới
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                // DropdownButton (Chuyển việc thay đổi giá trị sang widget cha)
                DropdownButton<String>(
                  value: 'Cho Thuê',
                  onChanged: (String? newValue) {
                    // Widget cha sẽ nhận sự thay đổi này và thay đổi nội dung body
                    if (newValue != null) {
                      // Cập nhật nội dung ở widget cha
                      // Gọi setState trong widget cha (HomePage)
                    }
                  },
                  items: <String>['Cho Thuê', 'Giá rẻ', 'Dịch Vụ Tốt']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: const Icon(Icons.arrow_drop_down),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(width: 16.0), // Khoảng cách giữa Dropdown và TextField
                // TextField
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      contentPadding:
                      const EdgeInsets.symmetric(vertical: 10.0),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chat),
                  onPressed: () {
                    // Chat action
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.grid_view),
                  onPressed: () {
                    // Grid view action
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedValue = 'Cho Thuê'; // Giá trị mặc định của dropdown

  // Hàm thay đổi nội dung body dựa trên giá trị dropdown
  Widget _buildBody() {
    switch (_selectedValue) {
      case 'Cho Thuê':
        return Center(child: Text("Hiển thị thông tin cho thuê"));
      case 'Giá rẻ':
        return Center(child: Text("Hiển thị thông tin giá rẻ"));
      case 'Dịch Vụ Tốt':
        return Center(child: Text("Hiển thị thông tin dịch vụ tốt"));
      default:
        return Center(child: Text("Chọn một tùy chọn"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarSP(),
      body: _buildBody(),
    );
  }
}
