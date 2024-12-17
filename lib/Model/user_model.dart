class User {
  String id;
  String usersId;
  String username;
  String password;
  PersonalInfo personalInfo;
  SecurityInfo securityInfo;
  SocialMedia socialMedia;
  String rolesId;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    required this.id,
    required this.usersId,
    required this.username,
    required this.password,
    required this.personalInfo,
    required this.securityInfo,
    required this.socialMedia,
    required this.rolesId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id']['\$oid'],
      usersId: json['Users_id'],
      username: json['Username'],
      password: json['Password'],
      personalInfo: PersonalInfo.fromJson(json['Personal_info']),
      securityInfo: SecurityInfo.fromJson(json['Security_info']),
      socialMedia: SocialMedia.fromJson(json['Social_media']),
      rolesId: json['Roles_id']['Roles_id'],
      createdAt: DateTime.parse(json['Created_at']['\$date']),
      updatedAt: DateTime.parse(json['Updated_at']['\$date']),
    );
  }
}

class PersonalInfo {
  String fullName;
  String phoneNumber;
  String address;
  String evocativeName;

  PersonalInfo({
    required this.fullName,
    required this.phoneNumber,
    required this.address,
    required this.evocativeName,
  });

  factory PersonalInfo.fromJson(Map<String, dynamic> json) {
    return PersonalInfo(
      fullName: json['Full_name'],
      phoneNumber: json['Phone_number'],
      address: json['Address'],
      evocativeName: json['Evocative_name'],
    );
  }
}

class SecurityInfo {
  String email;
  String identityNumber;
  List<String> favoriteCategories;
  String gender;
  DateTime dateOfBirth;

  SecurityInfo({
    required this.email,
    required this.identityNumber,
    required this.favoriteCategories,
    required this.gender,
    required this.dateOfBirth,
  });

  factory SecurityInfo.fromJson(Map<String, dynamic> json) {
    return SecurityInfo(
      email: json['Email'],
      identityNumber: json['Identity_number'],
      favoriteCategories: List<String>.from(json['Favorite_categories']),
      gender: json['Gender'],
      dateOfBirth: DateTime.parse(json['Date_of_birth']['\$date']),
    );
  }
}

class SocialMedia {
  String facebook;
  String google;
  String appleId;

  SocialMedia({
    required this.facebook,
    required this.google,
    required this.appleId,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) {
    return SocialMedia(
      facebook: json['Facebook'],
      google: json['Google'],
      appleId: json['Apple_id'],
    );
  }
}
