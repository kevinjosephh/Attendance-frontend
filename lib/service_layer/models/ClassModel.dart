import 'dart:convert';

class ClassModel {
  String? id;
  String? name;
  String? start_date;
  String? end_date;
  String? rollNo;
  String? className;
  String? email;
  String? password;
  ClassModel({
    this.id,
    this.name,
    this.start_date,
    this.end_date,
    this.rollNo,
    this.className,
    this.email,
    this.password,
  });

  ClassModel copyWith({
    String? id,
    String? name,
    String? start_date,
    String? end_date,
    String? rollNo,
    String? className,
    String? email,
    String? password,
  }) {
    return ClassModel(
      id: id ?? this.id,
      name: name ?? this.name,
      start_date: start_date ?? this.start_date,
      end_date: end_date ?? this.end_date,
      rollNo: rollNo ?? this.rollNo,
      className: className ?? this.className,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'start_date': start_date,
      'end_date': end_date,
      'rollNo': rollNo,
      'className': className,
      'email': email,
      'password': password,
    };
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList =
        parsedJsonList.map((i) => ClassModel.fromMap(i)).toList();
    return dartObjList;
  }

  factory ClassModel.fromMap(Map<String, dynamic> map) {
    return ClassModel(
      id: map['name'],
      name: map['name'],
      start_date: map['start_date'],
      end_date: map['end_date'],
      rollNo: map['rollNo'],
      className: map['className'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClassModel.fromJson(String source) =>
      ClassModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ClassModel(id: $id,name: $name, start_date: $start_date, end_date: $end_date, rollNo: $rollNo, className: $className, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ClassModel &&
        other.id == id &&
        other.name == name &&
        other.start_date == start_date &&
        other.end_date == end_date &&
        other.rollNo == rollNo &&
        other.className == className &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        start_date.hashCode ^
        end_date.hashCode ^
        rollNo.hashCode ^
        className.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
