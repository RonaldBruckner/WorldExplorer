class EmergencyData {
  final String isoCode;
  final String? ambulance; // Now a single string, not a list
  final String? fire;      // Now a single string, not a list
  final String? police;    // Now a single string, not a list

  EmergencyData({
    required this.isoCode,
    this.ambulance, // Made nullable as some numbers might be missing or vary
    this.fire,
    this.police,
  });

  factory EmergencyData.fromJson(String isoCode, Map<String, dynamic> json) {
    return EmergencyData(
      isoCode: isoCode, // The ISO code is now the key in your JSON
      ambulance: json['ambulance'],
      fire: json['fire'],
      police: json['police'],
    );
  }
}