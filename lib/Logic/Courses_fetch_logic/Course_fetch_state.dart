part of 'Course_fetch_bloc.dart';

abstract class CourseFetchState extends Equatable {
  const CourseFetchState();

  @override
  List<Object> get props => [];
}

class CourseFetchInitial extends CourseFetchState {}

class Course_Fetch_Loading_State extends CourseFetchState {
  final prevList;
  Course_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class Course_Fetch_Loaded_State extends CourseFetchState {
  final modelObjList;
  Course_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class Course_Fetch_Error_State extends CourseFetchState {
  final error;
  final prevList;

  Course_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class Course_Fetch_More_Loaded_ButEmpty_State extends CourseFetchState {
  final prevList;
  Course_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
