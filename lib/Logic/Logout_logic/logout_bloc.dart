import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../repo_layer/User_repo.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial()) {
    User_sp_repo user_sp_repo = User_sp_repo();
    on<Logout_button_click_event>((event, emit) async{
      // TODO: implement event handler
      emit(LogoutLoading_state());
      bool is_removed = await user_sp_repo.remove_user('user');
      is_removed ? emit(LogoutLoaded_state()) : emit(LogoutError_state());
    });
  }
}
