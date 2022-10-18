part of 'Teacher_fetch_bloc.dart';

abstract class TeacherFetchState extends Equatable {
  const TeacherFetchState();

  @override
  List<Object> get props => [];
}

class TeacherFetchInitial extends TeacherFetchState {}

class Teacher_Fetch_Loading_State extends TeacherFetchState {
  final prevList;
  Teacher_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class Teacher_Fetch_Loaded_State extends TeacherFetchState {
  final modelObjList;
  Teacher_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class Teacher_Fetch_Error_State extends TeacherFetchState {
  final error;
  final prevList;

  Teacher_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class Teacher_Fetch_More_Loaded_ButEmpty_State extends TeacherFetchState {
  final prevList;
  Teacher_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
