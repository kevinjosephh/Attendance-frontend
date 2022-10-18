import 'dart:convert';

class UserModelV2 {
  String? firstName;
  String? lastName;
  String? role;
  String? rollNo;
  String? className;
  String? email;
  String? password;
  UserModelV2({
    this.firstName,
    this.lastName,
    this.role,
    this.rollNo,
    this.className,
    this.email,
    this.password,
  });

  UserModelV2 copyWith({
    String? firstName,
    String? lastName,
    String? role,
    String? rollNo,
    String? className,
    String? email,
    String? password,
  }) {
    return UserModelV2(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      role: role ?? this.role,
      rollNo: rollNo ?? this.rollNo,
      className: className ?? this.className,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'rollNo': rollNo,
      'className': className,
      'email': email,
      'password': password,
    };
  }

  factory UserModelV2.fromMap(Map<String, dynamic> map) {
    return UserModelV2(
      firstName: map['firstName'],
      lastName: map['lastName'],
      role: map['role'],
      rollNo: map['rollNo'],
      className: map['className'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelV2.fromJson(String source) => UserModelV2.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModelV2(firstName: $firstName, lastName: $lastName, role: $role, rollNo: $rollNo, className: $className, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModelV2 &&
      other.firstName == firstName &&
      other.lastName == lastName &&
      other.role == role &&
      other.rollNo == rollNo &&
      other.className == className &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return firstName.hashCode ^
      lastName.hashCode ^
      role.hashCode ^
      rollNo.hashCode ^
      className.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
