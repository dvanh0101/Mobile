class Motel {
  final String id;
  final String motelsId;
  final String motelTypeId;
  final String name;
  final String description;
  final int price;
  final List<String> utilitiesId;
  final List<String> attachments;
  final int acreage;
  final String address;
  final List<String> reviewIds;
  final DateTime createAt;
  final DateTime updateAt;

  Motel({
    required this.id,
    required this.motelsId,
    required this.motelTypeId,
    required this.name,
    required this.description,
    required this.price,
    required this.utilitiesId,
    required this.attachments,
    required this.acreage,
    required this.address,
    required this.reviewIds,
    required this.createAt,
    required this.updateAt,
  });

  // Phương thức chuyển dữ liệu JSON thành đối tượng Motel
  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      id: json['_id']['\$oid'],
      motelsId: json['Motels_id'],
      motelTypeId: json['Motel_Type_id'],
      name: json['Name'],
      description: json['Description'],
      price: json['Price'],
      utilitiesId: List<String>.from(json['Utilities_id']),
      attachments: List<String>.from(json['Attachments']),
      acreage: json['Acreage'],
      address: json['Address'],
      reviewIds: List<String>.from(json['ReviewID']),
      createAt: DateTime.parse(json['CreateAt']['\$date']),
      updateAt: DateTime.parse(json['UpdateAt']['\$date']),
    );
  }
}
