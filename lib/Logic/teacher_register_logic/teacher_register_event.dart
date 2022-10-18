part of 'teacher_register_bloc.dart';

abstract class TeacherRegisterEvent extends Equatable {
  const TeacherRegisterEvent();

  @override
  List<Object> get props => [];
}

//! create

class Teacher_create_onButtonPressed_Event extends TeacherRegisterEvent {
  final modelObjToAdd;
  Teacher_create_onButtonPressed_Event(this.modelObjToAdd);
}

//!  update
class Teacher_Update_onButtonPressed_Event extends TeacherRegisterEvent {
  final modelObjToAdd;
  final modelObj_id;
  Teacher_Update_onButtonPressed_Event(this.modelObjToAdd, this.modelObj_id);
}

//!  delete
class Teacher_Delete_onButtonPressed_Event extends TeacherRegisterEvent {
  final modelObj_id;
  Teacher_Delete_onButtonPressed_Event(this.modelObj_id);
}
