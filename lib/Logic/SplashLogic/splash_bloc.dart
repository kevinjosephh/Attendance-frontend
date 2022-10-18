import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repo_layer/User_repo.dart';

part 'splash_event.dart';
part 'splash_state.dart';


class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    User_api_repo user_api_repo = User_api_repo();
    User_sp_repo user_sp_repo = User_sp_repo();
    on<Check_role_event>((event, emit) async{
      // TODO: implement event handler
      var user =await user_sp_repo.get_user('user');
      print(user);
      

      // var role = userInfo["role"];
      if (user == null){
        print("auth");
        emit(Role_is_auth_state());
      }
      else {
        Map userInfo = jsonDecode(user);
        var role = userInfo["role"];
        print(role);
        if (role == "Student"){
        print("user");
        emit(Role_is_student_state());
      } else if (role == "Teacher"){
        print("teacher");
        emit(Role_is_teacher_state());
      } else if (role == "Admin"){
        print("admin");
        emit(Role_is_admin_state());
      } else {
        print("auth");
        emit(Role_is_auth_state());
      }
      }
        
      
    });
  }
}
