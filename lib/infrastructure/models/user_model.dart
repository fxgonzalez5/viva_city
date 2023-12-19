import 'dart:convert';

class UserModel {
  final String id;
  final String? photoUrl;
  final String name;
  final String email;
  final String phone;
  final String? birthdate;
  final String? city;
  final String? province;
  final String? country;
  final List<String>? interests;

  UserModel({
    required this.id,
    this.photoUrl,
    required this.name,
    required this.email,
    required this.phone,
    this.birthdate,
    this.city,
    this.province,
    this.country,
    this.interests,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    photoUrl: json["photoUrl"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    birthdate: json["birthdate"],
    city: json["city"],
    province: json["province"],
    country: json["country"],
    interests: json["interests"] == null ? [] : List<String>.from(json["interests"]!.map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "photoUrl": photoUrl,
    "name": name,
    "email": email,
    "phone": phone,
    "birthdate": birthdate,
    "city": city,
    "province": province,
    "country": country,
    "interests": interests == null ? [] : List<dynamic>.from(interests!.map((x) => x)),
  };
}