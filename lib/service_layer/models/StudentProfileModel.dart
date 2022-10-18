import 'dart:convert';

class StudentProfileModel {
  // int? number;
  String first_name;
  String last_name;
  String role;
  String roll_no;
  String class_name;
  String email;
  StudentProfileModel({
    required this.first_name,
    required this.last_name,
    required this.role,
    required this.roll_no,
    required this.class_name,
    required this.email,
  });

  StudentProfileModel copyWith({
    String? first_name,
    String? last_name,
    String? role,
    String? roll_no,
    String? class_name,
    String? email,
  }) {
    return StudentProfileModel(
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      role: role ?? this.role,
      roll_no: roll_no ?? this.roll_no,
      class_name: class_name ?? this.class_name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'role': role,
      'roll_no': roll_no,
      'class_name': class_name,
      'email': email,
    };
  }

  factory StudentProfileModel.fromMap(Map<String, dynamic> map) {
    return StudentProfileModel(
      first_name: map['first_name'] ?? '',
      last_name: map['last_name'] ?? '',
      role: map['role'] ?? '',
      roll_no: map['roll_no'] ?? '',
      class_name: map['class_name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentProfileModel.fromJson(String source) => StudentProfileModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'StudentProfileModel(first_name: $first_name, last_name: $last_name, role: $role, roll_no: $roll_no, class_name: $class_name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is StudentProfileModel &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.role == role &&
      other.roll_no == roll_no &&
      other.class_name == class_name &&
      other.email == email;
  }

  @override
  int get hashCode {
    return first_name.hashCode ^
      last_name.hashCode ^
      role.hashCode ^
      roll_no.hashCode ^
      class_name.hashCode ^
      email.hashCode;
  }
}
