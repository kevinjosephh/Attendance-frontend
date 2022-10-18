import 'package:attendance/repo_layer/Course_repo.dart';
import 'package:attendance/repo_layer/User_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

import '../../service_layer/Exceptions/Exceptions.dart';

part 'Course_fetch_event.dart';
part 'Course_fetch_state.dart';

class CourseFetchBloc extends Bloc<CourseFetchEvent, CourseFetchState> {
  // int newCounter = 0;
  List newList = [];

  CourseFetchBloc() : super(CourseFetchInitial()) {
/* -------------------------------------------------------------------------- */
/*                             //@ repo class obj                             */
/* -------------------------------------------------------------------------- */
    Course_api_repo course_api_repo = Course_api_repo();

/* -------------------------------------------------------------------------- */
/*                        //@ Fetch + pagination                              */
/* -------------------------------------------------------------------------- */

    on<Course_Fetch_onInit_Event>((event, emit) async {
      try {
        emit(Course_Fetch_Loading_State(newList));

        //# incr counter
        // newCounter++;

        //# calling api
        //TODO : select one ( fetch all or fetch prop)
        final List moreFetchedList = await course_api_repo.fetchAll();
        // final List moreFetchedList =
        //     await queues_Api_Repo.fetchAll(newCounter);

        //# if nothing more is to fetch
        if (moreFetchedList.isEmpty) {
          emit(Course_Fetch_More_Loaded_ButEmpty_State(newList));

          //# adding more fetched to final list
        } else if (moreFetchedList.isNotEmpty) {
          newList.addAll(moreFetchedList);

          //# always send final list here
          emit(Course_Fetch_Loaded_State(newList));
        }

        //# catch error
      } catch (e) {
        print(e);
        var storeErr = CustomExceptions.checkExcp(e.runtimeType);
        emit(Course_Fetch_Error_State(storeErr, newList));
      }
    });

    on<Course_Fetch_onRefresh_Event>((event, emit) async {
      // newCounter = 0;
      newList.clear();
    });
  }
}
