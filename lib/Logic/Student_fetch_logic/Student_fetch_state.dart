part of 'Student_fetch_bloc.dart';

abstract class StudentFetchState extends Equatable {
  const StudentFetchState();

  @override
  List<Object> get props => [];
}

class StudentFetchInitial extends StudentFetchState {}

class Student_Fetch_Loading_State extends StudentFetchState {
  final prevList;
  Student_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class Student_Fetch_Loaded_State extends StudentFetchState {
  final modelObjList;
  Student_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class Student_Fetch_Error_State extends StudentFetchState {
  final error;
  final prevList;

  Student_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class Student_Fetch_More_Loaded_ButEmpty_State extends StudentFetchState {
  final prevList;
  Student_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
