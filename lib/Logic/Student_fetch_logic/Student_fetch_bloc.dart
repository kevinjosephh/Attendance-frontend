import 'package:attendance/repo_layer/User_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../service_layer/Exceptions/Exceptions.dart';

part 'Student_fetch_event.dart';
part 'Student_fetch_state.dart';

class StudentFetchBloc extends Bloc<StudentFetchEvent, StudentFetchState> {
  // int newCounter = 0;
  List newList = [];

  StudentFetchBloc() : super(StudentFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    User_api_repo user_api_repo = User_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<Student_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(Student_Fetch_Loading_State(newList));

        //# incr counter
        // newCounter++;

        //# calling api
        //TODO : select one ( fetch all or fetch prop)
        final List moreFetchedList = await user_api_repo.fetchAll();
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(Student_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.clear();
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(Student_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Student_Fetch_Error_State(storeErr, newList));
      }
    });

    on<Student_Fetch_onRefresh_Event>((event, emit) async {
      // newCounter = 0;
      newList.clear();
    });
  }
}
