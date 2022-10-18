part of 'Teacher_fetch_bloc.dart';

abstract class TeacherFetchEvent extends Equatable {
  const TeacherFetchEvent();

  @override
  List<Object> get props => [];
}

class Teacher_Fetch_onInit_Event extends TeacherFetchEvent {}

class Teacher_Fetch_onRefresh_Event extends TeacherFetchEvent {}
