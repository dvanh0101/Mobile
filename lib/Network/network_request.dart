import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student_lite/model/motels.dart';

class NetWorkRequest {
  static const String url =
      "https://raw.githubusercontent.com/dvanh0101/Mobile_Data/refs/heads/master";
  static Future<List<Motels>> getPersonalInfo() async {
    final response = await http.get(
      Uri.parse("$url/Student_Life.Motels.json"),
    );
    String body = response.body;
    List<dynamic> jsonList = jsonDecode(body);
    if (response.statusCode == 200) {
      return jsonList.map((json) => Motels.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load getPersonalInfo');
    }
  }
}
