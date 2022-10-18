part of 'user_register_bloc.dart';

abstract class UserRegisterEvent extends Equatable {
  const UserRegisterEvent();

  @override
  List<Object> get props => [];
}

//! create

class User_create_onButtonPressed_Event extends UserRegisterEvent {
  final modelObjToAdd;
  User_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class User_Update_onButtonPressed_Event extends UserRegisterEvent {
  final modelObjToAdd;
  final modelObj_id;
  User_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class User_Delete_onButtonPressed_Event extends UserRegisterEvent {
  final modelObj_id;
  User_Delete_onButtonPressed_Event(this.modelObj_id);
}
