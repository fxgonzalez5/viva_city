// To parse this JSON data, do
//
//     final eventModel = eventModelFromMap(jsonString);

import 'dart:convert';

List<EventModel> eventModelFromMap(String str) => List<EventModel>.from(json.decode(str).map((x) => EventModel.fromMap(x)));

String eventModelToMap(List<EventModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class EventModel {
    final int id;
    final String coverFileName;
    final String name;
    final List<String> labels;
    final String description;
    final List<String> images;
    final String place;
    final String hour;
    final String public;
    final String organizer;
    final double value;
    final DateTime date;
    final String location;
    final double latitude;
    final double longitude;
    final String type;

    EventModel({
        required this.id,
        required this.coverFileName,
        required this.name,
        required this.labels,
        required this.description,
        required this.images,
        required this.place,
        required this.hour,
        required this.public,
        required this.organizer,
        required this.value,
        required this.date,
        required this.location,
        required this.latitude,
        required this.longitude,
        required this.type,
    });

    factory EventModel.fromMap(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        coverFileName: json["CoverFileName"],
        name: json["Name"],
        labels: List<String>.from(json["Labels"].map((x) => x)),
        description: json["Description"],
        images: List<String>.from(json["Images"].map((x) => x)),
        place: json["Place"],
        hour: json["Hour"],
        public: json["Public"],
        organizer: json["Organizer"],
        value: json["Value"],
        date: DateTime.parse(json["Date"]),
        location: json["Location"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        type: json["Type"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "CoverFileName": coverFileName,
        "Name": name,
        "Labels": List<dynamic>.from(labels.map((x) => x)),
        "Description": description,
        "Images": List<dynamic>.from(images.map((x) => x)),
        "Place": place,
        "Hour": hour,
        "Public": public,
        "Organizer": organizer,
        "Value": value,
        "Date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "Location": location,
        "Latitude": latitude,
        "Longitude": longitude,
        "Type": type,
    };
}
