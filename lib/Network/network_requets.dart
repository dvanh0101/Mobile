import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student_lite/Model/Phong.dart';

class NetworkRequets {
  static const String url =
      'https://raw.githubusercontent.com/dvanh0101/DangVietAnh_Mobile/master/Student_Life.Motels.json';

  static Future<List<Phong>> fetchPhong() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Phong.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}
