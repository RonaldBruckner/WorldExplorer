class EmergencyData {
  final String isoCode;
  final List<String?> ambulance;
  final List<String?> fire;
  final List<String?> police;

  EmergencyData({
    required this.isoCode,
    required this.ambulance,
    required this.fire,
    required this.police,
  });

  factory EmergencyData.fromJson(Map<String, dynamic> json) {
    return EmergencyData(
      isoCode: json['Country']['ISOCode'],
      ambulance: List<String?>.from(json['Ambulance']['All']),
      fire: List<String?>.from(json['Fire']['All']),
      police: List<String?>.from(json['Police']['All']),
    );
  }
}