import 'package:attendance/screens/__Course_fetch_screen__/Course_fetch_fetchList/Course_fetch_listTile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Logic/Courses_fetch_logic/Course_fetch_bloc.dart';
import '../../Components/myComponents.dart';

class Course_fetch_fetchList_widget extends StatelessWidget {
  const Course_fetch_fetchList_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<CourseFetchBloc, CourseFetchState>(
        builder: (context, state) {
      if (state is Course_Fetch_Loaded_State) {
        return buildFetchList(state.modelObjList);
      } else if (state is Course_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(state.prevList);
      } else if (state is Course_Fetch_Loading_State) {
        return buildFetchList(state.prevList);
      } else if (state is Course_Fetch_Error_State) {
        return buildFetchList(state.prevList);
      }

      return buildFetchList([]);
    });
  }

/* -------------------------------------------------------------------------- */
/*                 //! if loaded then build fetchList                         */
/* -------------------------------------------------------------------------- */

  buildFetchList(List listArg) {
    return listArg.isEmpty
        ? MyComponents.showFetchListEmptyMsg()
        : ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: listArg.length,
            itemBuilder: (context, i) {
              return Course_fetch_listTile_widget(singleObj: listArg[i]);
            },
          );
  }
}
