part of 'Student_fetch_bloc.dart';

abstract class StudentFetchEvent extends Equatable {
  const StudentFetchEvent();

  @override
  List<Object> get props => [];
}

class Student_Fetch_onInit_Event extends StudentFetchEvent {}

class Student_Fetch_onRefresh_Event extends StudentFetchEvent {}
