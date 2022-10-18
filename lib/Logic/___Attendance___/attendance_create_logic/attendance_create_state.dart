part of 'attendance_create_bloc.dart';

abstract class AttendanceCreateState extends Equatable {
  const AttendanceCreateState();
  
  @override
  List<Object> get props => [];
}

class AttendanceCreateInitial extends AttendanceCreateState {}

class Attendance_success_state extends AttendanceCreateState {}

class Attendance_loading_state extends AttendanceCreateState {}

class Attendance_already_done_state extends AttendanceCreateState {}

class Attendance_error_state extends AttendanceCreateState {
  final error;

  Attendance_error_state(this.error);
  @override
  List<Object> get props => [error];
}