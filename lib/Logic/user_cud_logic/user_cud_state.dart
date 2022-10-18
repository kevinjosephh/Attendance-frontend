part of 'user_cud_bloc.dart';

abstract class UserCudState extends Equatable {
  const UserCudState();

  @override
  List<Object> get props => [];
}

class UserCudInitial extends UserCudState {}

//! create

class User_create_Loading_State extends UserCudState {}

class User_create_Loaded_State extends UserCudState {}

class User_create_Error_State extends UserCudState {
  final error;
  User_create_Error_State(this.error);
}

class User_create_doesnot_exsit_State extends UserCudState {
  final error;
  User_create_doesnot_exsit_State(this.error);
}

//! update

class User_update_Loading_State extends UserCudState {}

class User_update_Loaded_State extends UserCudState {}

class User_update_Error_State extends UserCudState {
  final error;
  User_update_Error_State(this.error);
}

//! delete
class User_Delete_Loading_state extends UserCudState {} //loading

class User_Delete_Loaded_state extends UserCudState {} //loaded

class User_Delete_Error_State extends UserCudState {
  final error;
  User_Delete_Error_State(this.error);
}
