part of 'StudentAttendance_fetch_bloc.dart';

abstract class StudentAttendanceFetchEvent extends Equatable {
  const StudentAttendanceFetchEvent();

  @override
  List<Object> get props => [];
}

class StudentAttendance_Fetch_onInit_Event extends StudentAttendanceFetchEvent {}

class StudentAttendance_Fetch_onRefresh_Event extends StudentAttendanceFetchEvent {}
