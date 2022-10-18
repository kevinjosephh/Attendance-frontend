part of 'studentProfile_fetch_id_bloc.dart';

abstract class StudentProfileFetchIdEvent extends Equatable {
  const StudentProfileFetchIdEvent();

  @override
  List<Object> get props => [];
}

class StudentProfile_FetchById_onButtonPressed_Event extends StudentProfileFetchIdEvent {
  final id;

  StudentProfile_FetchById_onButtonPressed_Event(this.id);
}
