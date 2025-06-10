import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Country {
  final String countryCode;
  final String name;
  final String capital;
  final int population;
  final List<String> languages;

  Country({
    required this.countryCode,
    required this.name,
    required this.capital,
    required this.population,
    required this.languages,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      countryCode: json['cca2'] ?? 'XX', // or whatever your API uses
      name: json['name']['common'] ?? 'Unknown',
      capital: (json['capital'] as List?)?.first ?? 'N/A',
      population: json['population'] ?? 0,
      languages: (json['languages'] as Map?)?.values.map((e) => e.toString()).toList() ?? [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'countryCode': countryCode,
      'name': name,
      'capital': capital,
      'population': population,
      'languages': languages.join(','),
    };
  }

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      countryCode: map['countryCode'],
      name: map['name'],
      capital: map['capital'],
      population: map['population'],
      languages: map['languages'].split(','),
    );
  }
}
