import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';
import 'package:student_lite/widgets/AnimatedBottomNavigationBar.dart';
import 'package:student_lite/widgets/fab.dart';

import '../widgets/AppBar.dart';
// import '../widgets/appbar-sp.dart';
import '../widgets/image-rights-requested.dart';

class chutro extends StatefulWidget {
  const chutro({Key? key}) : super(key: key);

  @override
  _chutroState createState() => _chutroState();
}

class _chutroState extends State<chutro> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController = TextEditingController();
  final _sizeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _rentController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  String _selectedRoomType = 'Phòng trọ';
  String _selectedPostType = 'Tất cả';
  final List<File> _images = [];
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _birthDateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConfigColor.backgroundwhite,
      appBar: CustomAppBar(onSearchSubmitted: (String ) {  },),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _titleController,
                        decoration: buildInputDecoration('Họ và tên'),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nhập đầy đủ họ tên';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _birthDateController,
                        decoration: buildInputDecoration('Ngày sinh'),
                        readOnly: true,
                        onTap: () async {
                          // Mở trình chọn ngày
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null) {
                            _birthDateController.text =
                            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}'; // Format ngày
                          }
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng chọn ngày sinh';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),

                ],
              ),

              const SizedBox(height: 8),
              Container(
                child: TextFormField(
                  controller: _priceController,
                  decoration: buildInputDecoration('Địa chỉ'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nhập địa chỉ phòng';
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: TextFormField(
                  controller: _locationController,
                  decoration: buildInputDecoration('CCCD'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nhập CCCD';
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: TextFormField(
                  controller: _locationController,
                  decoration: buildInputDecoration('Số điện thoại'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nhập số điện thoại';
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: TextFormField(
                  controller: _locationController,
                  decoration: buildInputDecoration('Tài khoản'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nhập tài khoản';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: TextFormField(
                  controller: _locationController,
                  decoration: buildInputDecoration('Mật khẩu'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nhập mật khẩu';
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      backgroundColor: StyleConfigColor.warning,
                      foregroundColor: StyleConfigColor.text2,
                    ),
                    child: const Text('Hủy'),
                  ),
                  const SizedBox(height: 8, width: 8,),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(8),
                      ),
                      backgroundColor: StyleConfigColor.green,
                      foregroundColor: StyleConfigColor.text2,
                    ),
                    child: const Text('Tiếp tục'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,155,0),
        child:
        fab(),
      ),
      bottomSheet: Stack(
        children: [
          MyHomePage(searchQuery: 'searchQuery',),
        ],
      ),
    );
  }

  Widget _buildImageGrid() {
    return _images.isEmpty
        ? const Text('Chưa có hình ảnh nào.')
        : GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: _images.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [
            Image.file(
              _images[index],
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 4,
              right: 4,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _images.removeAt(index);
                  });
                },
              ),
            ),
          ],
        );
      },
    );
  }

  InputDecoration buildInputDecoration(String labelText) {
    return InputDecoration(
      label: RichText(
        text: TextSpan(
          text: labelText,
          style: StyleConfigText.bodyTextRegular2
              .copyWith(color: StyleConfigColor.text), // Màu nhãn chính
          children: [
            TextSpan(
              text: ' *',
              style: TextStyle(
                  color: StyleConfigColor.warning), // Màu đỏ cho dấu *
            ),
          ],
        ),
      ),
      border: const OutlineInputBorder(),
    );
  }

  Future<bool> _requestPhotoPermission(BuildContext context) async {
    final status = await Permission.photos.request();
    return status.isGranted;
  }



  Future<void> _pickImages() async {
    setState(() => _isLoading = true);

    try {
      final hasPermission = await _requestPhotoPermission(context);
      if (hasPermission) {
        final picker = ImagePicker();
        final pickedFiles = await picker.pickMultiImage();

        if (pickedFiles != null) {
          setState(() {
            _images.addAll(pickedFiles.map((file) => File(file.path)));
          });
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Có lỗi xảy ra: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Form submitted successfully!')),
      );
    }
  }
}

