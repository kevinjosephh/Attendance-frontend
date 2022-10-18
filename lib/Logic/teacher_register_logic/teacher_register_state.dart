part of 'teacher_register_bloc.dart';

abstract class TeacherRegisterState extends Equatable {
  const TeacherRegisterState();

  @override
  List<Object> get props => [];
}

class TeacherRegisterInitial extends TeacherRegisterState {}

//! create

class Teacher_create_Loading_State extends TeacherRegisterState {}

class Teacher_create_Loaded_State extends TeacherRegisterState {}

class Teacher_create_Error_State extends TeacherRegisterState {
  final error;
  Teacher_create_Error_State(this.error);
}

class Teacher_create_doesnot_exsit_State extends TeacherRegisterState {
  final error;
  Teacher_create_doesnot_exsit_State(this.error);
}

//! update

class Teacher_update_Loading_State extends TeacherRegisterState {}

class Teacher_update_Loaded_State extends TeacherRegisterState {}

class Teacher_update_Error_State extends TeacherRegisterState {
  final error;
  Teacher_update_Error_State(this.error);
}

//! delete
class Teacher_Delete_Loading_state extends TeacherRegisterState {} //loading

class Teacher_Delete_Loaded_state extends TeacherRegisterState {} //loaded

class Teacher_Delete_Error_State extends TeacherRegisterState {
  final error;
  Teacher_Delete_Error_State(this.error);
}
