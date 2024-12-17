import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:device_info_plus/device_info_plus.dart';

class ImagePermissionRequestWidget extends StatelessWidget {
  final Function onGranted;

  const ImagePermissionRequestWidget({Key? key, required this.onGranted}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final hasPermission = await _requestPhotoPermission(context);
        if (hasPermission) {
          onGranted();
        }
      },
      child: const Text('Hiện Bottom Dialog'),
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
