part of 'studentProfile_fetch_id_bloc.dart';

abstract class StudentProfileFetchIdState extends Equatable {
  const StudentProfileFetchIdState();

  @override
  List<Object> get props => [];
}

class StudentProfileFetchIdInitial extends StudentProfileFetchIdState {}

class StudentProfile_FetchById_Loading_State extends StudentProfileFetchIdState {}

class StudentProfile_FetchById_Loaded_State extends StudentProfileFetchIdState {
  final modelObj;
  StudentProfile_FetchById_Loaded_State(this.modelObj);
}

class StudentProfile_FetchById_Error_State extends StudentProfileFetchIdState {
  final error;
  StudentProfile_FetchById_Error_State(this.error);
}
