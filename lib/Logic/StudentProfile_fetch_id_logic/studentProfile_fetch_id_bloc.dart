import 'package:attendance/repo_layer/studentProfile_repo.dart';
import 'package:attendance/service_layer/Exceptions/Exceptions.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'studentProfile_fetch_id_event.dart';
part 'studentProfile_fetch_id_state.dart';

class StudentProfileFetchIdBloc extends Bloc<StudentProfileFetchIdEvent, StudentProfileFetchIdState> {
  StudentProfileFetchIdBloc() : super(StudentProfileFetchIdInitial()) {
    /* -------------------------------------------------------------------------- */
/*                             //@ repo class objs                            */
/* -------------------------------------------------------------------------- */
    StudentProfile_api_repo studentProfile_Api_Repo = StudentProfile_api_repo();
    // StudentProfile_Gs_Repo studentProfile_Gs_Repo = StudentProfile_Gs_Repo();

/* -------------------------------------------------------------------------- */
/*                           //@ fetch single by id                           */
/* -------------------------------------------------------------------------- */
    on<StudentProfile_FetchById_onButtonPressed_Event>((event, emit) async {
      try {
        emit(StudentProfile_FetchById_Loading_State());

        //# from api repo class
        final response = await studentProfile_Api_Repo.fetchById(event.id);
        print(response);

        //# from GS repo class  ( uncomment if using gs )
        // final response = await studentProfile_Gs_Repo.fetchById_studentProfile(event.id);
        emit(StudentProfile_FetchById_Loaded_State(response));

        //# error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(StudentProfile_FetchById_Error_State(storeErr));
      }
    });
  }
}
