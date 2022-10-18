import 'package:attendance/screens/__Student_fetch_screen__/Student_fetch_fetchList/Student_fetch_listTile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Logic/Student_fetch_logic/Student_fetch_bloc.dart';
import '../../Components/myComponents.dart';

class Student_fetch_fetchList_widget extends StatelessWidget {
  const Student_fetch_fetchList_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<StudentFetchBloc, StudentFetchState>(builder: (context, state) {
      if (state is Student_Fetch_Loaded_State) {
        return buildFetchList(state.modelObjList);
      } else if (state is Student_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(state.prevList);
      } else if (state is Student_Fetch_Loading_State) {
        return buildFetchList(state.prevList);
      } else if (state is Student_Fetch_Error_State) {
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
              return Student_fetch_listTile_widget(singleObj: listArg[i]);
            },
          );
  }
}
