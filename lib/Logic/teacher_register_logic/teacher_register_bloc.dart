import 'package:attendance/repo_layer/User_repo.dart';
import 'package:attendance/service_layer/models/UserModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../service_layer/Exceptions/Exceptions.dart';
import '../../service_layer/models/UserModelV2.dart';

part 'teacher_register_event.dart';
part 'teacher_register_state.dart';

class TeacherRegisterBloc
    extends Bloc<TeacherRegisterEvent, TeacherRegisterState> {
  TeacherRegisterBloc() : super(TeacherRegisterInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */
    User_api_repo user_api_repo = User_api_repo();
    User_sp_repo user_sp_repo = User_sp_repo();

/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<Teacher_create_onButtonPressed_Event>((event, emit) async {
      emit(Teacher_create_Loading_State());

      try {
        //# from api repo
        var response =
            await user_api_repo.teacher_register(event.modelObjToAdd);
        if (response is UserModelV2) {
          emit(Teacher_create_Loaded_State());
        } else if (response is String) {
          emit(Teacher_create_doesnot_exsit_State(response));
        }
        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Teacher_create_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ update                                 */
/* -------------------------------------------------------------------------- */
//     on<Teacher_Update_onButtonPressed_Event>((event, emit) async {
//       emit(Teacher_update_Loading_State());

//       try {
//         //# from api repo
//         var response =
//             await user_api_repo.update(event.modelObjToAdd, event.modelObj_id);

//         //# from GS repo (NOTE:  if using GS, dont store response in var)
//         // await hoo_update_Gs_repo.update_hoo(
//         //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

//         emit(Teacher_update_Loaded_State());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(Teacher_update_Error_State(storeErr));
//       }
//     });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ delete                                 */
// /* -------------------------------------------------------------------------- */
//     on<Teacher_Delete_onButtonPressed_Event>((event, emit) async {
//       emit(Teacher_Delete_Loading_state());

//       try {
//         //# from api repo
//         //! note : api returns string response to delete
//         // dont use this stringResponse for logic, just use this to print
//         var StringReponse = await user_api_repo.delete(event.modelObj_id);

//         //# from Gs repo (NOTE:  if using GS, dont store response in var)
//         // await poo_delete_api_repo.delete_poo(event.modelObj_id);

//         emit(Teacher_Delete_Loaded_state());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(Teacher_Delete_Error_State(storeErr));
//       }
//     });
  }
}
