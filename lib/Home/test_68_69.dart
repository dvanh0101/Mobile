import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:student_lite/model/motel_model.dart';  // Đảm bảo model Motel đã tồn tại
import 'package:student_lite/Home/68_69.dart'; // Import màn hình chi tiết

class MotelListScreen extends StatefulWidget {
  @override
  _MotelListScreenState createState() => _MotelListScreenState();
}

class _MotelListScreenState extends State<MotelListScreen> {
  List<Motel> motels = [];
  bool isLoading = true;

  // Hàm lấy danh sách các nhà trọ
  Future<void> fetchMotels() async {
    final url = Uri.parse(
        'https://raw.githubusercontent.com/dvanh0101/Mobile_Data/refs/heads/master/Student_Life.Motels.json');

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          motels = data.map((motelJson) => Motel.fromJson(motelJson)).toList();
          isLoading = false;
        });
      } else {
        throw Exception('Failed to load motels');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to load motels: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchMotels();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motel List'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : motels.isEmpty
          ? Center(child: Text('No motels found'))
          : ListView.builder(
        itemCount: motels.length,
        itemBuilder: (context, index) {
          final motel = motels[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: Icon(Icons.house),
              title: Text(motel.name),
              subtitle: Text('${motel.address} - ${motel.price} VND'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                // Điều hướng đến màn hình chi tiết khi người dùng nhấn vào phòng trọ
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Screen_68_69(
                      motel: motel, // Truyền thông tin phòng qua constructor
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
