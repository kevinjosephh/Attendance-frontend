// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class QueueUser {
  int? id;
  String queue_name;
  String userAcc_name;
  String adminAcc_name;
  String joinedTime;
  int queue_fk;
  int userAcc_fk;
  int adminAcc_fk;
  QueueUser({
    this.id,
    required this.queue_name,
    required this.userAcc_name,
    required this.adminAcc_name,
    required this.joinedTime,
    required this.queue_fk,
    required this.userAcc_fk,
    required this.adminAcc_fk,
  });

  QueueUser copyWith({
    int? id,
    String? queue_name,
    String? userAcc_name,
    String? adminAcc_name,
    String? joinedTime,
    int? queue_fk,
    int? userAcc_fk,
    int? adminAcc_fk,
  }) {
    return QueueUser(
      id: id ?? this.id,
      queue_name: queue_name ?? this.queue_name,
      userAcc_name: userAcc_name ?? this.userAcc_name,
      adminAcc_name: adminAcc_name ?? this.adminAcc_name,
      joinedTime: joinedTime ?? this.joinedTime,
      queue_fk: queue_fk ?? this.queue_fk,
      userAcc_fk: userAcc_fk ?? this.userAcc_fk,
      adminAcc_fk: adminAcc_fk ?? this.adminAcc_fk,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'queue_name': queue_name,
      'userAcc_name': userAcc_name,
      'adminAcc_name': adminAcc_name,
      'joinedTime': joinedTime,
      'queue_fk': queue_fk,
      'userAcc_fk': userAcc_fk,
      'adminAcc_fk': adminAcc_fk,
    };
  }

  factory QueueUser.fromMap(Map<String, dynamic> map) {
    return QueueUser(
      id: map['id'] != null ? map['id'] as int : null,
      queue_name: map['queue_name'] as String,
      userAcc_name: map['userAcc_name'] as String,
      adminAcc_name: map['adminAcc_name'] as String,
      joinedTime: map['joinedTime'] as String,
      queue_fk: map['queue_fk'] as int,
      userAcc_fk: map['userAcc_fk'] as int,
      adminAcc_fk: map['adminAcc_fk'] as int,
    );
  }

  static fromMapList(rawData) {
    List parsedJsonList = rawData;
    List dartObjList = parsedJsonList.map((i) => QueueUser.fromMap(i)).toList();
    return dartObjList;
  }

  String toJson() => json.encode(toMap());

  factory QueueUser.fromJson(String source) =>
      QueueUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'QueueUser(id: $id, queue_name: $queue_name, userAcc_name: $userAcc_name, adminAcc_name: $adminAcc_name, joinedTime: $joinedTime, queue_fk: $queue_fk, userAcc_fk: $userAcc_fk, adminAcc_fk: $adminAcc_fk)';
  }

  @override
  bool operator ==(covariant QueueUser other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.queue_name == queue_name &&
        other.userAcc_name == userAcc_name &&
        other.adminAcc_name == adminAcc_name &&
        other.joinedTime == joinedTime &&
        other.queue_fk == queue_fk &&
        other.userAcc_fk == userAcc_fk &&
        other.adminAcc_fk == adminAcc_fk;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        queue_name.hashCode ^
        userAcc_name.hashCode ^
        adminAcc_name.hashCode ^
        joinedTime.hashCode ^
        queue_fk.hashCode ^
        userAcc_fk.hashCode ^
        adminAcc_fk.hashCode;
  }
}
