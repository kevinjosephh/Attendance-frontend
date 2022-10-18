import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repo_layer/User_repo.dart';
import '../../../service_layer/models/UserModel.dart';

part 'qr_scan_result_event.dart';
part 'qr_scan_result_state.dart';

class QrScanResultBloc extends Bloc<QrScanResultEvent, QrScanResultState> {
  User_api_repo user_api_repo = User_api_repo();
  User_sp_repo user_sp_repo = User_sp_repo();
  

  QrScanResultBloc() : super(QrScanResultInitial()) {
    on<QrScan_onInit_Event>((event, emit) async{
      UserModel user = user_sp_repo.get_model_user('user');
      var actualQrCode = user.class_name;
      if (event.barCodeRawValue != null) {
        if (event.barCodeRawValue == actualQrCode) {
          // write create attendance codesss
          emit(Qr_Detected_and_Right_State());
        } else if (event.barCodeRawValue != actualQrCode) {
          print(event.barCodeRawValue);
          print(actualQrCode);
          emit(Qr_Detected_and_Wrong_State());
        }
      } else {
        emit(Qr_NOT_Detected_State());
      }
    });
  }
}
