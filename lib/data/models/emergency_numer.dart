class EmergencyNumber {
  final String police;
  final String fire;
  final String ambulance;

  EmergencyNumber({
    required this.police,
    required this.fire,
    required this.ambulance,
  });

  factory EmergencyNumber.fromJson(Map<String, dynamic> json) {
    final data = json['data'];
    return EmergencyNumber(
      police: (data['police']['all'] as List).isNotEmpty ? data['police']['all'][0] : '',
      fire: (data['fire']['all'] as List).isNotEmpty ? data['fire']['all'][0] : '',
      ambulance: (data['ambulance']['all'] as List).isNotEmpty ? data['ambulance']['all'][0] : '',
    );
  }
}