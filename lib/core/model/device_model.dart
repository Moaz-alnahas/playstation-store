import 'dart:convert';

class DeviceModel {
  final String id;
  final String name;
  final String notes;
  final String type;
  final String rate;
  final List<String> sessions;

  DeviceModel({
    required this.id,
    required this.name,
    required this.notes,
    required this.type,
    required this.rate,
    required this.sessions,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'notes': notes,
      'type': type,
      'rate': rate,
      'sessions': sessions,
    };
  }

  factory DeviceModel.fromMap(Map<String, dynamic> map) {
    return DeviceModel(
      id: map['id'],
      name: map['name'],
      notes: map['notes'],
      type: map['type'],
      rate: map['rate'],
      sessions: List<String>.from(map['sessions']),
    );
  }

  String toJson() => json.encode(toMap());

  factory DeviceModel.fromJson(String source) =>
      DeviceModel.fromMap(json.decode(source));
}
