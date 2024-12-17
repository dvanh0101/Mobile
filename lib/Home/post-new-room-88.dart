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

class RoomForm extends StatefulWidget {
  const RoomForm({Key? key}) : super(key: key);

  @override
  _RoomFormState createState() => _RoomFormState();
}

class _RoomFormState extends State<RoomForm> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController = TextEditingController();
  final _sizeController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _rentController =
      TextEditingController(); // Controller mới cho "Cho thuê"

  String _selectedRoomType = 'Phòng trọ';
  String _selectedPostType = 'Tất cả';
  final List<File> _images = [];
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();

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
              ElevatedButton(
                onPressed: () async {
                  final hasPermission = await _requestPhotoPermission(context);
                  if (!hasPermission) {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => ImagePermissionRequestWidget(
                        onGranted: () {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Quyền đã được cấp.')),
                          );
                        },
                      ),
                    );
                  } else {
                    _pickImages();
                  }
                },
                child: const Text('Thêm Hình Ảnh'),
              ),
              const SizedBox(height: 8),
              // Hiển thị ảnh nếu có
              _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _buildImageGrid(),
              const SizedBox(height: 8),
              Container(
                child: DropdownButtonFormField<String>(
                  value: _selectedRoomType,
                  items: [
                    DropdownMenuItem(
                        value: 'Phòng trọ',
                        child: Text('Phòng trọ',
                            style: StyleConfigText.bodyTextRegular2
                                .copyWith(color: StyleConfigColor.text))),
                    DropdownMenuItem(
                        value: 'Nhà nguyên căn',
                        child: Text('Nhà nguyên căn',
                            style: StyleConfigText.bodyTextRegular2
                                .copyWith(color: StyleConfigColor.text))),
                    DropdownMenuItem(
                        value: 'Chung cư',
                        child: Text('Chung cư',
                            style: StyleConfigText.bodyTextRegular2
                                .copyWith(color: StyleConfigColor.text))),
                    DropdownMenuItem(
                        value: 'Phòng studio',
                        child: Text('Phòng studio',
                            style: StyleConfigText.bodyTextRegular2
                                .copyWith(color: StyleConfigColor.text))),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedRoomType = value!;
                    });
                  },
                  decoration: buildInputDecoration('Loại phòng'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng chọn loại phòng';
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: TextFormField(
                  controller: _titleController,
                  decoration: buildInputDecoration('Tiêu đề phòng'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập tiêu đề phòng';
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: TextFormField(
                  controller: _priceController,
                  decoration: buildInputDecoration('Giá phòng'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập giá phòng';
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: TextFormField(
                  controller: _locationController,
                  decoration: buildInputDecoration('Vị trí'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Vui lòng nhập vị trí';
                    }
                    return null;
                  },

                ),
              ),
              const SizedBox(height: 8),
              Container(
                child: DropdownButtonFormField<String>(
                  value: _selectedPostType,
                  items: [
                    DropdownMenuItem(
                        value: 'Tất cả',
                        child: Text('Tất cả',
                            style: StyleConfigText.bodyTextRegular2
                                .copyWith(color: StyleConfigColor.text))),
                    DropdownMenuItem(
                        value: 'Cá nhân',
                        child: Text('Cá nhân',
                            style: StyleConfigText.bodyTextRegular2
                                .copyWith(color: StyleConfigColor.text))),
                    DropdownMenuItem(
                        value: 'Môi giới',
                        child: Text('Môi giới',
                            style: StyleConfigText.bodyTextRegular2
                                .copyWith(color: StyleConfigColor.text))),
                  ],
                  onChanged: (value) {
                    setState(() {
                      _selectedPostType = value!;
                    });
                  },
                  decoration: buildInputDecoration('Loại bài đăng'),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      child: TextField(
                        controller: _rentController,
                        decoration: const InputDecoration(
                          labelText: 'Cho thuê',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.shopping_cart),
                          alignLabelWithHint: true,
                        ),
                        keyboardType: TextInputType.number,
                        enabled: false,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Container(
                      child: TextFormField(
                        controller: _sizeController,
                        decoration: buildInputDecoration('Diện tích'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập diện tích';
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
                child: TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Mô tả',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // Các nút cách đều nhau
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (_images.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Vui lòng thêm hình ảnh.')),
                          );
                          return; // Dừng lại nếu không có hình ảnh
                        }

                      }
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50),
                      // Kích thước hình chữ nhật
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Giảm bo góc (8px)
                      ),
                      backgroundColor: StyleConfigColor.green,
                      foregroundColor: StyleConfigColor.text2,
                    ),
                    child: const Text('Thêm'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Giảm bo góc (8px)
                      ),
                      backgroundColor: StyleConfigColor.warning,
                      foregroundColor: StyleConfigColor.text2,
                    ),
                    child: const Text('Xoá'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Giảm bo góc (8px)
                      ),
                      backgroundColor: StyleConfigColor.blue,
                      foregroundColor: StyleConfigColor.text2,
                    ),
                    child: const Text('Sửa'),
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
