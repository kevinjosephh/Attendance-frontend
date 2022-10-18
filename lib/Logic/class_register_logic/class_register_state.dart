part of 'class_register_bloc.dart';

abstract class ClassRegisterState extends Equatable {
  const ClassRegisterState();

  @override
  List<Object> get props => [];
}

class ClassRegisterInitial extends ClassRegisterState {}

//! create

class User_create_Loading_State extends ClassRegisterState {}

class User_create_Loaded_State extends ClassRegisterState {}

class User_create_Error_State extends ClassRegisterState {
  final error;
  User_create_Error_State(this.error);
}

class User_create_doesnot_exsit_State extends ClassRegisterState {
  final error;
  User_create_doesnot_exsit_State(this.error);
}

//! update

class User_update_Loading_State extends ClassRegisterState {}

class User_update_Loaded_State extends ClassRegisterState {}

class User_update_Error_State extends ClassRegisterState {
  final error;
  User_update_Error_State(this.error);
}

//! delete
class User_Delete_Loading_state extends ClassRegisterState {} //loading

class User_Delete_Loaded_state extends ClassRegisterState {} //loaded

class User_Delete_Error_State extends ClassRegisterState {
  final error;
  User_Delete_Error_State(this.error);
}
