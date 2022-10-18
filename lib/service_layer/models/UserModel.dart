import 'dart:convert';

class UserModel {
  String? id;
  String? first_name;
  String? last_name;
  String? role;
  String? roll_no;
  String? class_name;
  String? email;
  String? password;
  UserModel({
    this.id,
    this.first_name,
    this.last_name,
    this.role,
    this.roll_no,
    this.class_name,
    this.email,
    this.password,
  });

  UserModel copyWith({
    String? id,
    String? first_name,
    String? last_name,
    String? role,
    String? roll_no,
    String? class_name,
    String? email,
    String? password,
  }) {
    return UserModel(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      role: role ?? this.role,
      roll_no: roll_no ?? this.roll_no,
      class_name: class_name ?? this.class_name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'first_name': first_name,
      'last_name': last_name,
      'role': role,
      'roll_no': roll_no,
      'class_name': class_name,
      'email': email,
      'password': password,
    };
  }
  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => UserModel.fromMap(i)).toList();
    return dartObjList;
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      first_name: map['first_name'],
      last_name: map['last_name'],
      role: map['role'],
      roll_no: map['roll_no'],
      class_name: map['class_name'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, first_name: $first_name, last_name: $last_name, role: $role, roll_no: $roll_no, class_name: $class_name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.first_name == first_name &&
      other.last_name == last_name &&
      other.role == role &&
      other.roll_no == roll_no &&
      other.class_name == class_name &&
      other.email == email &&
      other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      first_name.hashCode ^
      last_name.hashCode ^
      role.hashCode ^
      roll_no.hashCode ^
      class_name.hashCode ^
      email.hashCode ^
      password.hashCode;
  }
}
