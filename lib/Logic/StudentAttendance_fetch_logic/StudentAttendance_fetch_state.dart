part of 'StudentAttendance_fetch_bloc.dart';

abstract class StudentAttendanceFetchState extends Equatable {
  const StudentAttendanceFetchState();

  @override
  List<Object> get props => [];
}

class StudentAttendanceFetchInitial extends StudentAttendanceFetchState {}

class StudentAttendance_Fetch_Loading_State extends StudentAttendanceFetchState {
  final prevList;
  StudentAttendance_Fetch_Loading_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}

class StudentAttendance_Fetch_Loaded_State extends StudentAttendanceFetchState {
  final modelObjList;
  StudentAttendance_Fetch_Loaded_State(this.modelObjList);

  @override
  List<Object> get props => [modelObjList];
}

class StudentAttendance_Fetch_Error_State extends StudentAttendanceFetchState {
  final error;
  final prevList;

  StudentAttendance_Fetch_Error_State(this.error, this.prevList);

  @override
  List<Object> get props => [error, prevList];
}

class StudentAttendance_Fetch_More_Loaded_ButEmpty_State extends StudentAttendanceFetchState {
  final prevList;
  StudentAttendance_Fetch_More_Loaded_ButEmpty_State(this.prevList);

  @override
  List<Object> get props => [prevList];
}
