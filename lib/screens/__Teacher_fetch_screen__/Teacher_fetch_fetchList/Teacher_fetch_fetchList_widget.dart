import 'package:attendance/screens/__Teacher_fetch_screen__/Teacher_fetch_fetchList/Teacher_fetch_listTile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Logic/Teacher_fetch_logic/Teacher_fetch_bloc.dart';
import '../../Components/myComponents.dart';

class Teacher_fetch_fetchList_widget extends StatelessWidget {
  const Teacher_fetch_fetchList_widget({super.key});

  @override
  Widget build(BuildContext context) {
    return fetchListStates();
  }

  /* -------------------------------------------------------------------------- */
/*                           //! fetch list states                            */
/* -------------------------------------------------------------------------- */

  fetchListStates() {
    return BlocBuilder<TeacherFetchBloc, TeacherFetchState>(
        builder: (context, state) {
      if (state is Teacher_Fetch_Loaded_State) {
        return buildFetchList(state.modelObjList);
      } else if (state is Teacher_Fetch_More_Loaded_ButEmpty_State) {
        return buildFetchList(state.prevList);
      } else if (state is Teacher_Fetch_Loading_State) {
        return buildFetchList(state.prevList);
      } else if (state is Teacher_Fetch_Error_State) {
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
              return Teacher_fetch_listTile_widget(singleObj: listArg[i]);
            },
          );
  }
}
