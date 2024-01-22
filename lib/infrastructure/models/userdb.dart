import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class UserDB {
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

  UserDB({
    required this.id,
    required this.photoUrl,
    required this.name,
    required this.email,
    required this.phone,
    required this.birthdate,
    required this.city,
    required this.province,
    required this.country,
    required this.interests,
    required this.eventNotification,
    required this.promotionsNotification,
    required this.emailNotification,
  });

  factory UserDB.fromJson(String str) => UserDB.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDB.fromMap(Map<String, dynamic> json) { 
    
    DateTime? timestampToDateTime(Timestamp? date) {
      if (date != null) return date.toDate();
      return null;
    }

    return UserDB(
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
}