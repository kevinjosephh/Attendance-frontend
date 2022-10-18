part of 'user_register_bloc.dart';

abstract class UserRegisterState extends Equatable {
  const UserRegisterState();

  @override
  List<Object> get props => [];
}

class UserRegisterInitial extends UserRegisterState {}

//! create

class User_create_Loading_State extends UserRegisterState {}

class User_create_Loaded_State extends UserRegisterState {}

class User_create_Error_State extends UserRegisterState {
  final error;
  User_create_Error_State(this.error);
}

class User_create_doesnot_exsit_State extends UserRegisterState {
  final error;
  User_create_doesnot_exsit_State(this.error);
}

//! update

class User_update_Loading_State extends UserRegisterState {}

class User_update_Loaded_State extends UserRegisterState {}

class User_update_Error_State extends UserRegisterState {
  final error;
  User_update_Error_State(this.error);
}

//! delete
class User_Delete_Loading_state extends UserRegisterState {} //loading

class User_Delete_Loaded_state extends UserRegisterState {} //loaded

class User_Delete_Error_State extends UserRegisterState {
  final error;
  User_Delete_Error_State(this.error);
}
