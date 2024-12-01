import 'package:flutter/material.dart';
import 'package:student_lite/utils/config-color.dart';
import '../utils/config-text.dart';

class ActiveStatusBody extends StatefulWidget {
  final String? selectedStatus; // Nhận trạng thái đã chọn từ parent
  final ValueChanged<String> onStatusChanged; // Callback để thông báo thay đổi trạng thái

  ActiveStatusBody({this.selectedStatus, required this.onStatusChanged});

  @override
  _ActiveStatusBodyState createState() => _ActiveStatusBodyState();
}

class _ActiveStatusBodyState extends State<ActiveStatusBody> {
  String? _selectedStatus;

  // List of available statuses
  final List<String> _statusOptions = [
    'Bất kỳ ai',
    'Người theo dõi',
    'Người theo dõi mà bạn theo dõi lại',
    'Không ai cả',
  ];

  @override
  void initState() {
    super.initState();
    // Nếu không có trạng thái nào được truyền vào, mặc định là "Bất kỳ ai"
    _selectedStatus = widget.selectedStatus ?? _statusOptions[0];
  }

  // Helper function to build a RadioListTile for each status
  Widget _buildRadioListTile(String value) {
    return RadioListTile<String>(
      title: Text(value), // Text comes first
      value: value, // The value for this radio button
      groupValue: _selectedStatus, // The selected value
      onChanged: (newValue) {
        setState(() {
          _selectedStatus = newValue;
          widget.onStatusChanged(newValue!); // Notify the parent about the change
        });
      },
      activeColor: StyleConfigColor.blue, // Set the active (selected) radio button color
    );
  }





  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Center(
              child: Text(
                'Trạng thái hoạt động',
                style: StyleConfigText.bodyTextBlack1,
              ),
            ),
          ),
          Divider(),
          // Build the radio buttons dynamically
          Column(
            children: _statusOptions.map((status) => _buildRadioListTile(status)).toList(),
          ),
        ],
      ),
    );
  }
}
