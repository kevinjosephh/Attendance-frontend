import 'package:attendance/repo_layer/studentAttendance_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../service_layer/Exceptions/Exceptions.dart';

part 'StudentAttendance_fetch_event.dart';
part 'StudentAttendance_fetch_state.dart';

class StudentAttendanceFetchBloc extends Bloc<StudentAttendanceFetchEvent, StudentAttendanceFetchState> {
  int newCounter = 0;
  List newList = [];

  StudentAttendanceFetchBloc() : super(StudentAttendanceFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    StudentAttendance_api_repo studentAttendance_api_repo = StudentAttendance_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<StudentAttendance_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(StudentAttendance_Fetch_Loading_State(newList));

        //# incr counter
        newCounter++;

        //# calling api
        //TODO : select one ( fetch all or fetch prop)
        final List moreFetchedList =
            await studentAttendance_api_repo.fetchProp(newCounter);
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(StudentAttendance_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(StudentAttendance_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(StudentAttendance_Fetch_Error_State(storeErr, newList));
      }
    });

    on<StudentAttendance_Fetch_onRefresh_Event>((event, emit) async {
      newCounter = 0;
      newList.clear();
    });
  }
}
