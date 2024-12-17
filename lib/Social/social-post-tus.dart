import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class BottomDialogDemo extends StatelessWidget {
  const BottomDialogDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () async {
          final hasPermission = await _requestPhotoPermission(context);
          if (hasPermission) {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const BottomDialogPostTus(),
            );
          }
        },
        child: const Text('Hiện Bottom Dialog'),
      ),
    );
  }

  Future<bool> _requestPhotoPermission(BuildContext context) async {
    final permission = await _getPhotoPermissionType();
    final status = await permission.request();

    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      _showPermissionDeniedDialog(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bạn cần cấp quyền để truy cập ảnh!')),
      );
    }
    return false;
  }

  Future<Permission> _getPhotoPermissionType() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return (androidInfo.version.sdkInt >= 33) ? Permission.photos : Permission.storage;
    } else {
      return Permission.photos; // iOS
    }
  }

  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cần cấp quyền truy cập ảnh'),
          content: const Text('Quyền truy cập ảnh đã bị từ chối vĩnh viễn. Vui lòng vào cài đặt để cấp quyền.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                openAppSettings();
              },
              child: const Text('Cài đặt'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Hủy'),
            ),
          ],
        );
      },
    );
  }
}

class BottomDialogPostTus extends StatefulWidget {
  const BottomDialogPostTus({Key? key}) : super(key: key);

  @override
  State<BottomDialogPostTus> createState() => _BottomDialogPostTusState();
}

class _BottomDialogPostTusState extends State<BottomDialogPostTus> {
  final List<File> _images = [];
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      height: screenHeight * 0.8,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildHeader(context),
            const Divider(),
            _buildUserInfo(),
            const SizedBox(height: 16),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Bạn đang nghĩ gì?',
                border: InputBorder.none,
              ),
            ),
            const Divider(),
            IconButton(
              icon: const Icon(Icons.add_a_photo),
              onPressed: _pickImages,
            ),
            const SizedBox(height: 8),
            _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _buildImageGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Hủy', style: TextStyle(color: Colors.red)),
        ),
        const Text(
          'Tin mới',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        TextButton(
          onPressed: () {
            // Xử lý đăng
          },
          child: const Text('Đăng'),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      children: [
        const CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage('assets/logo.png'), // Đường dẫn ảnh
        ),
        const SizedBox(width: 16),
        const Text(
          'name',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildImageGrid() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Image.file(
            _images[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
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

  Future<bool> _requestPhotoPermission(BuildContext context) async {
    final permission = await _getPhotoPermissionType();
    final status = await permission.request();

    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      _showPermissionDeniedDialog(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Bạn cần cấp quyền để truy cập ảnh!')),
      );
    }
    return false;
  }

  Future<Permission> _getPhotoPermissionType() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return (androidInfo.version.sdkInt >= 33) ? Permission.photos : Permission.storage;
    } else {
      return Permission.photos; // iOS
    }
  }

  void _showPermissionDeniedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Cần cấp quyền truy cập ảnh'),
        content: const Text('Quyền truy cập ảnh đã bị từ chối vĩnh viễn. Vui lòng vào cài đặt để cấp quyền.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: const Text('Cài đặt'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Hủy'),
          ),
        ],
      ),
    );
  }
}
