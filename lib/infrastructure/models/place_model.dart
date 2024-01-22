// To parse this JSON data, do
//
//     final placeModel = placeModelFromMap(jsonString);

import 'dart:convert';

List<PlaceModel> placeModelFromMap(String str) => List<PlaceModel>.from(json.decode(str).map((x) => PlaceModel.fromMap(x)));

String placeModelToMap(List<PlaceModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class PlaceModel {
    final int id;
    final String coverFileName;
    final String name;
    final double qualification;
    final String description;
    final List<String> schedules;
    final String location;
    final List<String> images;
    final double latitude;
    final double longitude;
    final String type;

    PlaceModel({
        required this.id,
        required this.coverFileName,
        required this.name,
        required this.qualification,
        required this.description,
        required this.schedules,
        required this.location,
        required this.images,
        required this.latitude,
        required this.longitude,
        required this.type,
    });

    factory PlaceModel.fromMap(Map<String, dynamic> json) => PlaceModel(
        id: json["id"],
        coverFileName: json["CoverFileName"],
        name: json["Name"],
        qualification: json["Qualification"],
        description: json["Description"],
        schedules: List<String>.from(json["Schedules"].map((x) => x)),
        location: json["Location"],
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
        "Description": description,
        "Schedules": List<dynamic>.from(schedules.map((x) => x)),
        "Location": location,
        "Images": List<dynamic>.from(images.map((x) => x)),
        "Latitude": latitude,
        "Longitude": longitude,
        "Type": type,
    };
}
