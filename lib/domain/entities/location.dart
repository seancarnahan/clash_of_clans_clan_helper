import 'dart:convert';

class Location {
  final int id;
  final String name;
  final bool isCountry;
  final String? localizedName;
  final String? countryCode;

  Location({
    required this.id,
    required this.name,
    required this.isCountry,
    this.localizedName,
    this.countryCode,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      isCountry: json['isCountry'],
      localizedName: json.containsKey('localizedName') ? json['localizedName'] : null,
      countryCode: json.containsKey('countryCode') ? json['countryCode'] : null,
    );
  }

  static String toJson(Location? location) {
    Map<String, dynamic> locationMap = {
      'name': location?.name,
      'id': location?.id,
      'isCountry': location?.isCountry,
      'localizedName': location?.localizedName,
      'countryCode': location?.countryCode,
    };
    return jsonEncode(locationMap);
  }
}
