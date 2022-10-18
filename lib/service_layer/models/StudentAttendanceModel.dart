import 'dart:convert';

class StudentAttendanceModel {
  String id;
  String first_name;
  String last_name;
  String roll_no;
  StudentAttendanceModel({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.roll_no,
  });

  StudentAttendanceModel copyWith({
    String? id,
    String? first_name,
    String? last_name,
    String? roll_no,
  }) {
    return StudentAttendanceModel(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      roll_no: roll_no ?? this.roll_no,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'roll_no': roll_no,
    };
  }

  factory StudentAttendanceModel.fromMap(Map<String, dynamic> map) {
    return StudentAttendanceModel(
      id: map['id'] ?? '',
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      roll_no: map['roll_no'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentAttendanceModel.fromJson(String source) => StudentAttendanceModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentAttendanceModel(id: $id, first_name: $first_name, last_name: $last_name, roll_no: $roll_no)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StudentAttendanceModel &&
      other.id == id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.roll_no == roll_no;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      roll_no.hashCode;
  }
}
