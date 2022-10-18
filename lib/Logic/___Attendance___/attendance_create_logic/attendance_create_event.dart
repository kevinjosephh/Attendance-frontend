part of 'attendance_create_bloc.dart';

abstract class AttendanceCreateEvent extends Equatable {
  const AttendanceCreateEvent();

  @override
  List<Object> get props => [];
}

class Create_attendance_event extends AttendanceCreateEvent{}
