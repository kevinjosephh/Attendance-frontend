part of 'splash_bloc.dart';

abstract class SplashState extends Equatable {
  const SplashState();
  
  @override
  List<Object> get props => [];
}

class SplashInitial extends SplashState {}
class Role_is_auth_state extends SplashState {}
class Role_is_student_state extends SplashState {}
class Role_is_teacher_state extends SplashState {}
class Role_is_admin_state extends SplashState {}