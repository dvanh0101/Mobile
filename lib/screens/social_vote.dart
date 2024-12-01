import 'package:flutter/material.dart';
import 'package:student_lite/widgets/BottomNaviagtionBar_Social.dart';

// Widget chính để chạy ứng dụng
class SocialVote extends StatelessWidget {
  const SocialVote({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt banner debug ở góc màn hình
      theme: ThemeData(
        primaryColor: Colors.blue, // Đặt màu chính cho ứng dụng
        scaffoldBackgroundColor: Colors.grey[100], // Màu nền chính của ứng dụng
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.black), // Đặt màu chữ mặc định
        ),
      ),
      home: const PollCreationScreen(), // Giao diện chính của ứng dụng
    );
  }
}

// Giao diện chính để tạo cuộc bình chọn
class PollCreationScreen extends StatefulWidget {
  const PollCreationScreen({super.key});

  @override
  State<PollCreationScreen> createState() => _PollCreationScreenState();
}

class _PollCreationScreenState extends State<PollCreationScreen> {
  final List<String> options = ['']; // Danh sách các phương án bình chọn
  bool hideVoters = true; // Ẩn người bình chọn
  bool hideResults = false; // Ẩn kết quả khi chưa bình chọn
  bool allowMultipleChoices = true; // Cho phép chọn nhiều phương án
  bool allowAddingOptions = true; // Cho phép thêm phương án

  DateTime? selectedDate; // Ngày hết hạn được chọn

  // Thêm một phương án mới
  void _addOption() {
    setState(() {
      options.add('');
    });
  }

  // Xóa phương án tại vị trí chỉ định
  void _removeOption(int index) {
    setState(() {
      options.removeAt(index);
    });
  }

  // Cập nhật nội dung của phương án
  void _updateOption(int index, String value) {
    setState(() {
      options[index] = value;
    });
  }

  // Xử lý logic khi gửi cuộc bình chọn
  void _submitPoll() {
    print('Câu hỏi bình chọn: ${options.where((o) => o.isNotEmpty).toList()}');
    print('Ẩn người bình chọn: $hideVoters');
    print('Ẩn kết quả: $hideResults');
    print('Chọn nhiều: $allowMultipleChoices');
    print('Thêm phương án: $allowAddingOptions');
    print('Ngày hết hạn: ${selectedDate ?? "Chưa đặt"}');
  }

  int _currentIndex = 0; // Chỉ mục của thanh điều hướng

  // Thay đổi chỉ mục của thanh điều hướng
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Hiển thị hộp thoại chọn ngày
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(), // Ngày hiện tại làm mặc định
      firstDate: DateTime.now(), // Không được chọn ngày trước hiện tại
      lastDate: DateTime(2100), // Giới hạn tối đa
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tạo Bình Chọn',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white, // Màu nền của AppBar
        elevation: 1, // Độ cao bóng của AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black), // Nút quay lại
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: _submitPoll, // Gửi dữ liệu khi bấm nút "Đăng"
            child: const Text(
              'Đăng',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // Cho phép cuộn nội dung khi bị tràn
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Đặt câu hỏi bình chọn',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Column(
                children: List.generate(options.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) => _updateOption(index, value), // Cập nhật phương án
                            decoration: InputDecoration(
                              hintText: 'Phương án ${index + 1}', // Gợi ý nội dung
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red), // Nút xóa phương án
                          onPressed: () => _removeOption(index),
                        ),
                      ],
                    ),
                  );
                }),
              ),
              if (allowAddingOptions) // Hiển thị nút thêm phương án nếu được phép
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: _addOption,
                    icon: const Icon(Icons.add, color: Colors.blue),
                    label: const Text(
                      'Thêm phương án',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              const SizedBox(height: 24),
              const Divider(), // Đường phân cách
              const Text(
                'Tùy chọn',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Đặt thời hạn'),
                subtitle: Text(
                  selectedDate != null
                      ? 'Ngày đã chọn: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
                      : 'Chưa đặt thời hạn',
                  style: const TextStyle(color: Colors.grey),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.date_range, color: Colors.grey), // Biểu tượng chọn ngày
                  onPressed: () => _selectDate(context),
                ),
              ),
              // Các tùy chọn dạng bật/tắt
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Ẩn người bình chọn'),
                value: hideVoters,
                onChanged: (value) {
                  setState(() {
                    hideVoters = value;
                  });
                },
                activeColor: Colors.blue,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Ẩn kết quả khi chưa bình chọn'),
                value: hideResults,
                onChanged: (value) {
                  setState(() {
                    hideResults = value;
                  });
                },
                activeColor: Colors.blue,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Chọn nhiều phương án'),
                value: allowMultipleChoices,
                onChanged: (value) {
                  setState(() {
                    allowMultipleChoices = value;
                  });
                },
                activeColor: Colors.blue,
              ),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: const Text('Có thể thêm phương án'),
                value: allowAddingOptions,
                onChanged: (value) {
                  setState(() {
                    allowAddingOptions = value;
                  });
                },
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar_Social(
        onItemSelected: _onItemTapped, // Xử lý khi chọn mục trong thanh điều hướng
        selectedIndex: _currentIndex, // Chỉ mục đang chọn
      ),
    );
  }
}
