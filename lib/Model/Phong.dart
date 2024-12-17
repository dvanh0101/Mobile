class Phong {
  Id? iId;
  String? motelsId;
  String? motelTypeId;
  String? name;
  String? description;
  int? price;
  List<String>? utilitiesId;
  List<String>? attachments;
  int? acreage;
  String? address;
  List<String>? reviewID;
  CreateAt? createAt;
  CreateAt? updateAt;
  List<String>? imageUrls;

  Phong({
    this.iId,
    this.motelsId,
    this.motelTypeId,
    this.name,
    this.description,
    this.price,
    this.utilitiesId,
    this.attachments,
    this.acreage,
    this.address,
    this.reviewID,
    this.createAt,
    this.updateAt,
    this.imageUrls,
  });

  factory Phong.fromJson(Map<String, dynamic> json) {
    return Phong(
      iId: json['_id'] != null ? Id.fromJson(json['_id']) : null,
      motelsId: json['Motels_id'],
      motelTypeId: json['Motel_Type_id'],
      name: json['Name'],
      description: json['Description'],
      price: json['Price'],
      utilitiesId: json['Utilities_id'] != null ? List<String>.from(json['Utilities_id']) : [],
      attachments: json['Attachments'] != null ? List<String>.from(json['Attachments']) : [],
      acreage: json['Acreage'],
      address: json['Address'],
      reviewID: json['ReviewID'] != null ? List<String>.from(json['ReviewID']) : [],
      createAt: json['CreateAt'] != null ? CreateAt.fromJson(json['CreateAt']) : null,
      updateAt: json['UpdateAt'] != null ? CreateAt.fromJson(json['UpdateAt']) : null,
      imageUrls: json['ImageUrls'] != null ? List<String>.from(json['ImageUrls']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.iId != null) {
      data['_id'] = this.iId!.toJson();
    }
    data['Motels_id'] = this.motelsId;
    data['Motel_Type_id'] = this.motelTypeId;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Price'] = this.price;
    data['Utilities_id'] = this.utilitiesId;
    data['Attachments'] = this.attachments;
    data['Acreage'] = this.acreage;
    data['Address'] = this.address;
    data['ReviewID'] = this.reviewID;
    if (this.createAt != null) {
      data['CreateAt'] = this.createAt!.toJson();
    }
    if (this.updateAt != null) {
      data['UpdateAt'] = this.updateAt!.toJson();
    }
    data['ImageUrls'] = this.imageUrls;
    return data;
  }
}

class Id {
  String? oid;

  Id({this.oid});

  factory Id.fromJson(Map<String, dynamic> json) {
    return Id(oid: json['\$oid']);
  }

  Map<String, dynamic> toJson() {
    return {'\$oid': this.oid};
  }
}

class CreateAt {
  String? date;

  CreateAt({this.date});

  factory CreateAt.fromJson(Map<String, dynamic> json) {
    return CreateAt(date: json['\$date']);
  }

  Map<String, dynamic> toJson() {
    return {'\$date': this.date};
  }
}
