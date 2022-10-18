part of 'Course_fetch_bloc.dart';

abstract class CourseFetchEvent extends Equatable {
  const CourseFetchEvent();

  @override
  List<Object> get props => [];
}

class Course_Fetch_onInit_Event extends CourseFetchEvent {}

class Course_Fetch_onRefresh_Event extends CourseFetchEvent {}
