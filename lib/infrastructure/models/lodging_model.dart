// To parse this JSON data, do
//
//     final lodgingModel = lodgingModelFromMap(jsonString);

import 'dart:convert';

List<LodgingModel> lodgingModelFromMap(String str) => List<LodgingModel>.from(json.decode(str).map((x) => LodgingModel.fromMap(x)));

String lodgingModelToMap(List<LodgingModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class LodgingModel {
    final int id;
    final String coverFileName;
    final String name;
    final double qualification;
    final String location;
    final String airport;
    final String address;
    final String telephone;
    final String cellphone;
    final String email;
    final String web;
    final String description;
    final String services;
    final List<String> images;
    final double latitude;
    final double longitude;
    final String type;

    LodgingModel({
        required this.id,
        required this.coverFileName,
        required this.name,
        required this.qualification,
        required this.location,
        required this.airport,
        required this.address,
        required this.telephone,
        required this.cellphone,
        required this.email,
        required this.web,
        required this.description,
        required this.services,
        required this.images,
        required this.latitude,
        required this.longitude,
        required this.type,
    });

    factory LodgingModel.fromMap(Map<String, dynamic> json) => LodgingModel(
        id: json["id"],
        coverFileName: json["CoverFileName"],
        name: json["Name"],
        qualification: json["Qualification"]?.toDouble(),
        location: json["Location"],
        airport: json["Airport"],
        address: json["Address"],
        telephone: json["Telephone"],
        cellphone: json["Cellphone"],
        email: json["Email"],
        web: json["Web"],
        description: json["Description"],
        services: json["Services"],
        images: List<String>.from(json["Images"].map((x) => x)),
        latitude: json["Latitude"]?.toDouble(),
        longitude: json["Longitude"]?.toDouble(),
        type: json["Type"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "CoverFileName": coverFileName,
        "Name": name,
        "Qualification": qualification,
        "Location": location,
        "Airport": airport,
        "Address": address,
        "Telephone": telephone,
        "Cellphone": cellphone,
        "Email": email,
        "Web": web,
        "Description": description,
        "Services": services,
        "Images": List<dynamic>.from(images.map((x) => x)),
        "Latitude": latitude,
        "Longitude": longitude,
        "Type": type,
    };
}
