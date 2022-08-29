// To parse this JSON data, do
//
//     final countryApiData = countryApiDataFromMap(jsonString);

import 'dart:convert';

class CountryApiData {
  CountryApiData({
    this.name,
    this.country,
  });

  String? name;
  List<Country>? country;

  factory CountryApiData.fromJson(String str) =>
      CountryApiData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CountryApiData.fromMap(Map<String, dynamic> json) => CountryApiData(
      name: json["name"] ?? '',
      country: List<Country>.from(
          json["country"].map((x) => Country.fromMap(x)) ?? []));

  Map<String, dynamic> toMap() => {
        "name": name,
        "country": List<dynamic>.from(country!.map((x) => x.toMap())),
      };
}

class Country {
  Country({
    this.countryId,
    this.probability,
  });

  String? countryId;
  double? probability;

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        countryId: json["country_id"] ?? '',
        probability: json["probability"].toDouble() ?? 0.0,
      );

  Map<String, dynamic> toMap() => {
        "country_id": countryId,
        "probability": probability,
      };
}
