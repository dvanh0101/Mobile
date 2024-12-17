import 'package:flutter/material.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:student_lite/utils/config-color.dart';
import 'package:student_lite/utils/config-text.dart';
import '../widgets/appbar_sp.dart';

Future<Map<String, dynamic>> fetchReviewStatistics(
    String url, String motelId) async {
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> reviews = json.decode(response.body);

      // Lọc các đánh giá theo Motel_id
      final filteredReviews =
      reviews.where((review) => review['Motel_id'] == motelId).toList();

      if (filteredReviews.isNotEmpty) {
        // Tính tổng rating và số lượng đánh giá
        final totalRating = filteredReviews.fold<int>(
          0,
              (sum, review) => sum + (review['rating'] as int),
        );
        final count = filteredReviews.length;

        // Tính tỷ lệ phần trăm cho mỗi rating sao
        final ratingDistribution = List<int>.filled(5, 0);
        for (var review in filteredReviews) {
          final rating = review['rating'] as int;
          if (rating >= 1 && rating <= 5) {
            ratingDistribution[rating - 1]++;
          }
        }

        return {
          'rating': totalRating / count, // Tính rating trung bình
          'customerCount': count,
          'ratingDistribution': ratingDistribution, // Tỷ lệ phần trăm cho từng sao
        };
      }
    }
  } catch (e) {
    print('Lỗi khi đọc dữ liệu: $e');
  }

  // Trả về giá trị mặc định nếu xảy ra lỗi
  return {'rating': 0.0, 'customerCount': 0, 'ratingDistribution': List<int>.filled(5, 0)};
}

class ReviewStatisticsScreen extends StatefulWidget {
  final String motelId;
  ReviewStatisticsScreen({required this.motelId});

  @override
  _ReviewStatisticsScreenState createState() => _ReviewStatisticsScreenState();
}

class _ReviewStatisticsScreenState extends State<ReviewStatisticsScreen> {
  final String url =
      'https://raw.githubusercontent.com/dvanh0101/Mobile_Data/master/Student_Life.Reviews.json';

  int selectedStars = 0; // Số sao được chọn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: StyleConfigColor.backgroundwhite,
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchReviewStatistics(url, widget.motelId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Lỗi khi tải dữ liệu'));
          } else if (snapshot.hasData) {
            final rating = snapshot.data!['rating'] as double;
            final customerCount = snapshot.data!['customerCount'] as int;
            final ratingDistribution = snapshot.data!['ratingDistribution'] as List<int>;

            return Column(
              children: [
                AppbarSp(),
                Divider(
                  thickness: 5,
                  color: StyleConfigColor.background,
                  height: 0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Đánh giá',
                          style: StyleConfigText.bodyTextBlack1,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Tóm tắt các bài đánh giá trên sàn',
                          style: StyleConfigText.bodyTextBlack1,
                        ),
                        SizedBox(height: 16),
                        Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: StyleConfigColor.backgroundwhite,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: StyleConfigColor.grayShade200,
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              const Text(
                                'Review',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 16),
                              Column(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '⭐ $rating',
                                    style: StyleConfigText.bodyTextBlack1,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    '$customerCount customer rating',
                                    style: StyleConfigText.bodyTextRegular3
                                        .copyWith(color: StyleConfigColor.gray),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Divider(),
                              ..._buildRatingDistribution(ratingDistribution),
                            ],
                          ),
                        ),
                        SizedBox(height: 18),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundImage: AssetImage('assets/avatar.png'),
                              backgroundColor: Colors.grey.shade200,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Xếp hạng và đánh giá',
                              style: StyleConfigText.bodyTextRegular1,
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Chia sẻ trải nghiệm của bạn để giúp đỡ mọi người.',
                              textAlign: TextAlign.center,
                              style: StyleConfigText.bodyTextRegular2,
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedStars =
                                      index + 1; // Cập nhật số sao được chọn
                                });
                              },
                              child: Icon(
                                index < selectedStars
                                    ? Icons.star
                                    : Icons.star_border,
                                size: 50,
                                color: index < selectedStars
                                    ? StyleConfigColor.yellow
                                    : StyleConfigColor.grayShade300,
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(child: Text('Không có dữ liệu'));
        },
      ),
    );
  }

  List<Widget> _buildRatingDistribution(List<int> ratingDistribution) {
    final totalReviews = ratingDistribution.reduce((a, b) => a + b);

    return List.generate(5, (index) {
      final percentage = totalReviews > 0
          ? (ratingDistribution[4 - index] / totalReviews) * 100
          : 0;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Text(
                '${5 - index} ⭐',  // Sao 5 ở trên cùng và giảm dần
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                height: 8,
                child: LinearProgressIndicator(
                  value: percentage / 100,
                  color: StyleConfigColor.yellow,
                  backgroundColor: StyleConfigColor.grayShade200,
                ),
              ),
            ),
            SizedBox(width: 8),
            SizedBox(
              width: 42,
              child: Text(
                '${percentage.toStringAsFixed(0)}%',  // Hiển thị phần trăm dưới dạng số nguyên
                style: StyleConfigText.bodyTextRegular3
                    .copyWith(color: StyleConfigColor.gray),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
      );
    });
  }


}
