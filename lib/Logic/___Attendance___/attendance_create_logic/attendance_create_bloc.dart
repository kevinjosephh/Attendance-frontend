import 'package:attendance/repo_layer/User_repo.dart';
import 'package:attendance/service_layer/models/UserModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../service_layer/Exceptions/Exceptions.dart';

part 'attendance_create_event.dart';
part 'attendance_create_state.dart';

class AttendanceCreateBloc extends Bloc<AttendanceCreateEvent, AttendanceCreateState> {
  AttendanceCreateBloc() : super(AttendanceCreateInitial()) {
    User_api_repo user_api_repo = User_api_repo();
    User_sp_repo user_sp_repo = User_sp_repo();
    on<AttendanceCreateEvent>((event, emit) async{
      // TODO: implement event handler
      emit(Attendance_loading_state());

      try {
        //# from api repo
        UserModel user = user_sp_repo.get_model_user('user');
        print(user);
        UserModel object = UserModel(id: user.id);
        var response = await user_api_repo.attendance(object);
        print(response);
        if (response){
          emit(Attendance_success_state());
        } else if(response == false){
          emit(Attendance_already_done_state());
        }
        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Attendance_error_state(storeErr));
      }
    });
  }
}
