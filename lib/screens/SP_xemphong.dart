import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-text.dart'; // Assuming this file contains text styles
import '../utils/config-color.dart'; // Assuming this file contains color definitions

class XemPhong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Xem Phòng'),
      ),
      body: Stack(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: SpXemphongFormDialog(), // Use SpXemphongFormDialog instead of BookingFormDialog
                    );
                  },
                );
              },
              child: Text('Đặt xem phòng'),
            ),
          ),
        ],
      ),
    );
  }
}

class SpXemphongFormDialog extends StatefulWidget {
  @override
  _SpXemphongFormDialogState createState() => _SpXemphongFormDialogState(); // Correct state class name
}

class _SpXemphongFormDialogState extends State<SpXemphongFormDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateController = TextEditingController(); // Changed email to date
  final TextEditingController timeController = TextEditingController(); // Changed to time controller
  final TextEditingController messageController = TextEditingController();

  bool isButtonEnabled = false;

  // Helper function for required labels
  Widget buildRequiredLabel(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.text),
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red), // Red asterisk for required fields
          ),
        ],
      ),
    );
  }

  // Check if all fields are filled
  void checkIfAllFieldsFilled() {
    setState(() {
      isButtonEnabled = nameController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          dateController.text.isNotEmpty &&
          timeController.text.isNotEmpty; // Check if time field is filled
    });
  }

  // Date picker function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        dateController.text = "${selectedDate.toLocal()}".split(' ')[0]; // Format the date as yyyy-mm-dd
      });
    }
  }

  // Time picker function
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        final hour = selectedTime.hour.toString().padLeft(2, '0');
        final minute = selectedTime.minute.toString().padLeft(2, '0');
        timeController.text = "$hour:$minute"; // Format the time as HH:mm
      });
    }
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkIfAllFieldsFilled);
    phoneController.addListener(checkIfAllFieldsFilled);
    dateController.addListener(checkIfAllFieldsFilled);
    timeController.addListener(checkIfAllFieldsFilled);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    dateController.dispose();
    timeController.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: StyleConfigColor.background,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Yêu cầu hẹn xem phòng',
                style: StyleConfigText.bodyTextBlack2,
              ),
              SizedBox(height: 8),
              Text(
                'Để lại thông tin để người đăng tin liên hệ với bạn ngay.',
                style: StyleConfigText.bodyTextSemiBold4,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        label: buildRequiredLabel('Họ và tên'),
                        fillColor: StyleConfigColor.text2,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(color: StyleConfigColor.text),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        label: buildRequiredLabel('Số điện thoại'),
                        fillColor: StyleConfigColor.text2,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: StyleConfigColor.text),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => _selectDate(context), // Show the date picker when tapped
                child: AbsorbPointer(
                  child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                      label: buildRequiredLabel('Ngày hẹn'),
                      fillColor: StyleConfigColor.text2,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: TextStyle(color: StyleConfigColor.text),
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () => _selectTime(context), // Show the time picker when tapped
                child: AbsorbPointer(
                  child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                      label: buildRequiredLabel('Thời gian hẹn'),
                      fillColor: StyleConfigColor.text2,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    style: TextStyle(color: StyleConfigColor.text),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: messageController,
                decoration: InputDecoration(
                  labelText: 'Thêm lời nhắn (100 ký tự)',
                  labelStyle: StyleConfigText.bodyTextRegular3,
                  fillColor: StyleConfigColor.text2,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignLabelWithHint: true,
                ),
                maxLength: 100,
                maxLines: 3,
                style: TextStyle(color: StyleConfigColor.text),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                  Navigator.of(context).pop();
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isButtonEnabled
                      ? StyleConfigColor.keppel
                      : Colors.grey,
                ),
                child: Text(
                  'Gửi thông tin',
                  style: StyleConfigText.bodyTextRegular1
                      .copyWith(color: StyleConfigColor.text2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
