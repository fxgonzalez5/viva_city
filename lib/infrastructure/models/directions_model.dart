// To parse this JSON data, do
//
//     final directionsModel = directionsModelFromMap(jsonString);

import 'dart:convert';

DirectionsModel directionsModelFromMap(String str) => DirectionsModel.fromMap(json.decode(str));

String directionsModelToMap(DirectionsModel data) => json.encode(data.toMap());

class DirectionsModel {
    final List<GeocodedWaypoint> geocodedWaypoints;
    final List<Route> routes;
    final String status;

    DirectionsModel({
        required this.geocodedWaypoints,
        required this.routes,
        required this.status,
    });

    factory DirectionsModel.fromMap(Map<String, dynamic> json) => DirectionsModel(
        geocodedWaypoints: List<GeocodedWaypoint>.from(json["geocoded_waypoints"].map((x) => GeocodedWaypoint.fromMap(x))),
        routes: List<Route>.from(json["routes"].map((x) => Route.fromMap(x))),
        status: json["status"],
    );

    Map<String, dynamic> toMap() => {
        "geocoded_waypoints": List<dynamic>.from(geocodedWaypoints.map((x) => x.toMap())),
        "routes": List<dynamic>.from(routes.map((x) => x.toMap())),
        "status": status,
    };
}

class GeocodedWaypoint {
    final String geocoderStatus;
    final String placeId;
    final List<String> types;

    GeocodedWaypoint({
        required this.geocoderStatus,
        required this.placeId,
        required this.types,
    });

    factory GeocodedWaypoint.fromMap(Map<String, dynamic> json) => GeocodedWaypoint(
        geocoderStatus: json["geocoder_status"],
        placeId: json["place_id"],
        types: List<String>.from(json["types"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "geocoder_status": geocoderStatus,
        "place_id": placeId,
        "types": List<dynamic>.from(types.map((x) => x)),
    };
}

class Route {
    final Bounds bounds;
    final String copyrights;
    final List<Leg> legs;
    final Polyline overviewPolyline;
    final String summary;
    final List<dynamic> warnings;
    final List<dynamic> waypointOrder;

    Route({
        required this.bounds,
        required this.copyrights,
        required this.legs,
        required this.overviewPolyline,
        required this.summary,
        required this.warnings,
        required this.waypointOrder,
    });

    factory Route.fromMap(Map<String, dynamic> json) => Route(
        bounds: Bounds.fromMap(json["bounds"]),
        copyrights: json["copyrights"],
        legs: List<Leg>.from(json["legs"].map((x) => Leg.fromMap(x))),
        overviewPolyline: Polyline.fromMap(json["overview_polyline"]),
        summary: json["summary"],
        warnings: List<dynamic>.from(json["warnings"].map((x) => x)),
        waypointOrder: List<dynamic>.from(json["waypoint_order"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "bounds": bounds.toMap(),
        "copyrights": copyrights,
        "legs": List<dynamic>.from(legs.map((x) => x.toMap())),
        "overview_polyline": overviewPolyline.toMap(),
        "summary": summary,
        "warnings": List<dynamic>.from(warnings.map((x) => x)),
        "waypoint_order": List<dynamic>.from(waypointOrder.map((x) => x)),
    };
}

class Bounds {
    final Northeast northeast;
    final Northeast southwest;

    Bounds({
        required this.northeast,
        required this.southwest,
    });

    factory Bounds.fromMap(Map<String, dynamic> json) => Bounds(
        northeast: Northeast.fromMap(json["northeast"]),
        southwest: Northeast.fromMap(json["southwest"]),
    );

    Map<String, dynamic> toMap() => {
        "northeast": northeast.toMap(),
        "southwest": southwest.toMap(),
    };
}

class Northeast {
    final double lat;
    final double lng;

    Northeast({
        required this.lat,
        required this.lng,
    });

    factory Northeast.fromMap(Map<String, dynamic> json) => Northeast(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
    );

    Map<String, dynamic> toMap() => {
        "lat": lat,
        "lng": lng,
    };
}

class Leg {
    final Distance distance;
    final Distance duration;
    final String endAddress;
    final Northeast endLocation;
    final String startAddress;
    final Northeast startLocation;
    final List<Step> steps;
    final List<dynamic> trafficSpeedEntry;
    final List<dynamic> viaWaypoint;

    Leg({
        required this.distance,
        required this.duration,
        required this.endAddress,
        required this.endLocation,
        required this.startAddress,
        required this.startLocation,
        required this.steps,
        required this.trafficSpeedEntry,
        required this.viaWaypoint,
    });

    factory Leg.fromMap(Map<String, dynamic> json) => Leg(
        distance: Distance.fromMap(json["distance"]),
        duration: Distance.fromMap(json["duration"]),
        endAddress: json["end_address"],
        endLocation: Northeast.fromMap(json["end_location"]),
        startAddress: json["start_address"],
        startLocation: Northeast.fromMap(json["start_location"]),
        steps: List<Step>.from(json["steps"].map((x) => Step.fromMap(x))),
        trafficSpeedEntry: List<dynamic>.from(json["traffic_speed_entry"].map((x) => x)),
        viaWaypoint: List<dynamic>.from(json["via_waypoint"].map((x) => x)),
    );

    Map<String, dynamic> toMap() => {
        "distance": distance.toMap(),
        "duration": duration.toMap(),
        "end_address": endAddress,
        "end_location": endLocation.toMap(),
        "start_address": startAddress,
        "start_location": startLocation.toMap(),
        "steps": List<dynamic>.from(steps.map((x) => x.toMap())),
        "traffic_speed_entry": List<dynamic>.from(trafficSpeedEntry.map((x) => x)),
        "via_waypoint": List<dynamic>.from(viaWaypoint.map((x) => x)),
    };
}

class Distance {
    final String text;
    final int value;

    Distance({
        required this.text,
        required this.value,
    });

    factory Distance.fromMap(Map<String, dynamic> json) => Distance(
        text: json["text"],
        value: json["value"],
    );

    Map<String, dynamic> toMap() => {
        "text": text,
        "value": value,
    };
}

class Step {
    final Distance distance;
    final Distance duration;
    final Northeast endLocation;
    final String htmlInstructions;
    final Polyline polyline;
    final Northeast startLocation;
    final String travelMode;
    final String? maneuver;

    Step({
        required this.distance,
        required this.duration,
        required this.endLocation,
        required this.htmlInstructions,
        required this.polyline,
        required this.startLocation,
        required this.travelMode,
        this.maneuver,
    });

    factory Step.fromMap(Map<String, dynamic> json) => Step(
        distance: Distance.fromMap(json["distance"]),
        duration: Distance.fromMap(json["duration"]),
        endLocation: Northeast.fromMap(json["end_location"]),
        htmlInstructions: json["html_instructions"],
        polyline: Polyline.fromMap(json["polyline"]),
        startLocation: Northeast.fromMap(json["start_location"]),
        travelMode: json["travel_mode"],
        maneuver: json["maneuver"],
    );

    Map<String, dynamic> toMap() => {
        "distance": distance.toMap(),
        "duration": duration.toMap(),
        "end_location": endLocation.toMap(),
        "html_instructions": htmlInstructions,
        "polyline": polyline.toMap(),
        "start_location": startLocation.toMap(),
        "travel_mode": travelMode,
        "maneuver": maneuver,
    };
}

class Polyline {
    final String points;

    Polyline({
        required this.points,
    });

    factory Polyline.fromMap(Map<String, dynamic> json) => Polyline(
        points: json["points"],
    );

    Map<String, dynamic> toMap() => {
        "points": points,
    };
}
