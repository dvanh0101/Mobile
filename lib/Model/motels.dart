class Motels {
  final String Motels_id;
  final String Motel_Type_id;
  final String Name;
  final String Description;
  final List<String> Attachments;
  final double Price;
  final double Acreage;
  final String Address;

  Motels({
    required this.Motels_id,
    required this.Motel_Type_id,
    required this.Name,
    required this.Description,
    required this.Attachments,
    required this.Price,
    required this.Acreage,
    required this.Address,
  });

  factory Motels.fromJson(Map<String, dynamic> json) {
    return Motels(
      Motels_id: json['Motels_id'],
      Motel_Type_id: json['Motel_Type_id'],
      Name: json['Name'],
      Description: json['Description'],
      Attachments: List<String>.from(json['Attachments']),
      Price: json['Price'] != null ? json['Price'].toDouble() : 0.0,
      Acreage: json['Acreage'] != null ? json['Acreage'].toDouble() : 0.0,
      Address: json['Address'],
    );
  }
}
