import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-text.dart';

import '../utils/config-color.dart';

// class RequestReservationDialog extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Đặt phòng'),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: ElevatedButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return BackdropFilter(
//                       filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                       child: BookingFormDialog(),
//                     );
//                   },
//                 );
//               },
//               child: Text('Đặt phòng ngay'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class BookingFormDialog extends StatefulWidget {
  @override
  _BookingFormDialogState createState() => _BookingFormDialogState();
}

class _BookingFormDialogState extends State<BookingFormDialog> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  bool isButtonEnabled = false;

  Widget buildRequiredLabel(String label) {
    return RichText(
      text: TextSpan(
        text: label,
        style: StyleConfigText.bodyTextRegular3.copyWith(color: StyleConfigColor.text), // Default label color
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red), // Red asterisk
          ),
        ],
      ),
    );
  }

  void checkIfAllFieldsFilled() {
    setState(() {
      isButtonEnabled = nameController.text.isNotEmpty &&
          phoneController.text.isNotEmpty &&
          emailController.text.isNotEmpty &&
          idController.text.isNotEmpty &&
          addressController.text.isNotEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    nameController.addListener(checkIfAllFieldsFilled);
    phoneController.addListener(checkIfAllFieldsFilled);
    emailController.addListener(checkIfAllFieldsFilled);
    idController.addListener(checkIfAllFieldsFilled);
    addressController.addListener(checkIfAllFieldsFilled);
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    idController.dispose();
    addressController.dispose();
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
          color: StyleConfigColor.background, // Set the background color of the dialog
          borderRadius: BorderRadius.circular(10.0), // Optional: round the corners
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Yêu cầu đặt phòng',
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
                        fillColor: StyleConfigColor.text2, // Màu nền của ô nhập liệu
                        filled: true, // Kích hoạt màu nền
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      style: TextStyle(color: StyleConfigColor.text), // Màu chữ của văn bản nhập vào
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        label: buildRequiredLabel('Số điện thoại'),
                        fillColor: StyleConfigColor.text2, // Màu nền của ô nhập liệu
                        filled: true, // Kích hoạt màu nền
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: StyleConfigColor.text), // Màu chữ của văn bản nhập vào
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  label: buildRequiredLabel('Email'),
                  fillColor: StyleConfigColor.text2, // Màu nền của ô nhập liệu
                  filled: true, // Kích hoạt màu nền
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: StyleConfigColor.text), // Màu chữ của văn bản nhập vào
              ),
              SizedBox(height: 10),
              TextField(
                controller: idController,
                decoration: InputDecoration(
                  label: buildRequiredLabel('CCCD/CMND'),
                  fillColor: StyleConfigColor.text2, // Màu nền của ô nhập liệu
                  filled: true, // Kích hoạt màu nền
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(color: StyleConfigColor.text), // Màu chữ của văn bản nhập vào
              ),
              SizedBox(height: 10),
              TextField(
                controller: addressController,
                decoration: InputDecoration(
                  label: buildRequiredLabel('Địa chỉ'),
                  fillColor: StyleConfigColor.text2, // Màu nền của ô nhập liệu
                  filled: true, // Kích hoạt màu nền
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                style: TextStyle(color: StyleConfigColor.text), // Màu chữ của văn bản nhập vào
              ),
              SizedBox(height: 10),
              TextField(
                controller: messageController,
                decoration: InputDecoration(
                  labelText: 'Thêm lời nhắn (100 ký tự)',
                  labelStyle: StyleConfigText.bodyTextRegular3,
                  fillColor: StyleConfigColor.text2, // Màu nền của ô nhập liệu
                  filled: true, // Kích hoạt màu nền
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  alignLabelWithHint: true,
                ),
                maxLength: 100,
                maxLines: 3,
                style: TextStyle(color: StyleConfigColor.text), // Màu chữ của văn bản nhập vào
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
                      : Colors.grey, // Màu nền của nút
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

