import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String? photoUrl;
  final String name;
  final String email;
  final String phone;
  final DateTime? birthdate;
  final String? city;
  final String? province;
  final String? country;
  final List<String> interests;
  final bool eventNotification;
  final bool promotionsNotification;
  final bool emailNotification;

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
    this.interests = const [],
    this.eventNotification = false,
    this.promotionsNotification = false,
    this.emailNotification = false,
  });

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) { 
    
    DateTime? timestampToDateTime(Timestamp? date) {
      if (date != null) return date.toDate();
      return null;
    }

    return UserModel(
      id: json["id"],
      photoUrl: json["photoUrl"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      birthdate: timestampToDateTime(json["birthdate"]),
      city: json["city"],
      province: json["province"],
      country: json["country"],
      interests: List<String>.from(json["interests"].map((x) => x)),
      eventNotification: json["eventNotification"],
      promotionsNotification: json["promotionsNotification"],
      emailNotification: json["emailNotification"],
    );
  }

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
    "interests": interests,
    "eventNotification": eventNotification,
    "promotionsNotification": promotionsNotification,
    "emailNotification": emailNotification, 
  };

  UserModel copyWith({
    String? id,
    String? photoUrl,
    String? name,
    String? email,
    String? phone,
    DateTime? birthdate,
    String? city,
    String? province,
    String? country,
    List<String>? interests,
    bool? eventNotification,
    bool? promotionsNotification,
    bool? emailNotification,
  }) => UserModel(
    id: id ?? this.id,
    photoUrl: photoUrl ?? this.photoUrl,
    name: name ?? this.name,
    email: email ?? this.email,
    phone: phone ?? this.phone,
    birthdate: birthdate ?? this.birthdate,
    city: city ?? this.city,
    province: province ?? this.province,
    country: country ?? this.country,
    interests: interests ?? this.interests,
    eventNotification: eventNotification ?? this.eventNotification,
    promotionsNotification: promotionsNotification ?? this.promotionsNotification,
    emailNotification: emailNotification ?? this.emailNotification,
  );

  bool equals(UserModel newUser) {
    return id == newUser.id &&
      photoUrl == newUser.photoUrl &&
      name == newUser.name &&
      email == newUser.email &&
      phone == newUser.phone &&
      birthdate == newUser.birthdate &&
      city == newUser.city &&
      province == newUser.province &&
      country == newUser.country &&
      interests == newUser.interests &&
      eventNotification == newUser.eventNotification &&
      promotionsNotification == newUser.promotionsNotification &&
      emailNotification == newUser.emailNotification;
  }

}