import 'package:attendance/repo_layer/User_repo.dart';
import 'package:attendance/service_layer/models/UserModel.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../service_layer/Exceptions/Exceptions.dart';
import '../../service_layer/models/UserModelV2.dart';

part 'user_register_event.dart';
part 'user_register_state.dart';

class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegisterBloc() : super(UserRegisterInitial()) {
/* -------------------------------------------------------------------------- */
/*                         //@  Dependency injection                          */
/* -------------------------------------------------------------------------- */
    User_api_repo user_api_repo = User_api_repo();
    User_sp_repo user_sp_repo = User_sp_repo();

/* -------------------------------------------------------------------------- */
/*                                 //@ create                                 */
/* -------------------------------------------------------------------------- */
    on<User_create_onButtonPressed_Event>((event, emit) async {
      emit(User_create_Loading_State());

      try {
        //# from api repo
        var response = await user_api_repo.register(event.modelObjToAdd);
        if (response is UserModelV2){
          emit(User_create_Loaded_State());
        } else if(response is String){
          emit(User_create_doesnot_exsit_State(response));
        }
        // //# from repo (NOTE:  if using GS, dont store response in var)
        // await voo_create_Gs_repo.create_voo(event.modelObjToAdd);

        

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(User_create_Error_State(storeErr));
      }
    });

/* -------------------------------------------------------------------------- */
/*                                 //@ update                                 */
/* -------------------------------------------------------------------------- */
//     on<User_Update_onButtonPressed_Event>((event, emit) async {
//       emit(User_update_Loading_State());

//       try {
//         //# from api repo
//         var response =
//             await user_api_repo.update(event.modelObjToAdd, event.modelObj_id);

//         //# from GS repo (NOTE:  if using GS, dont store response in var)
//         // await hoo_update_Gs_repo.update_hoo(
//         //     modelObj: event.modelObjToAdd, modelObj_id: event.modelObj_id);

//         emit(User_update_Loaded_State());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(User_update_Error_State(storeErr));
//       }
//     });

// /* -------------------------------------------------------------------------- */
// /*                                 //@ delete                                 */
// /* -------------------------------------------------------------------------- */
//     on<User_Delete_onButtonPressed_Event>((event, emit) async {
//       emit(User_Delete_Loading_state());

//       try {
//         //# from api repo
//         //! note : api returns string response to delete
//         // dont use this stringResponse for logic, just use this to print
//         var StringReponse = await user_api_repo.delete(event.modelObj_id);

//         //# from Gs repo (NOTE:  if using GS, dont store response in var)
//         // await poo_delete_api_repo.delete_poo(event.modelObj_id);

//         emit(User_Delete_Loaded_state());

//         //# error
//       } catch (e) {
//         print(e);
//         var storeErr = CustomExceptions.checkExcp(e.runtimeType);
//         emit(User_Delete_Error_State(storeErr));
//       }
//     });
  }
}
