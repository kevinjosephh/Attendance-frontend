import 'package:attendance/service_layer/models/StudentAttendanceModel.dart';

import '../service_layer/models/StudentProfileModel.dart';
import '../service_layer/services/ApiHelper.dart';
import '../service_layer/services/secret_credentials/global.dart';

class StudentAttendance_api_repo {

  //Todo : (IMP) All functions of this class must be await , or else wont work
  //Todo : make sure to include JsonList method in modelClass from snipit.io
  

/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here
  final _provider = ApiHelper.ApiHelperObj;

  int pageSizeVar = 15;  // used in pagination of fetches


/* -------------------------------------------------------------------------- */
/*                                //! Fetch All                               */
/* -------------------------------------------------------------------------- */
  fetchAll(int counter) async {
    var rawData = await _provider.fetchJsonList(
      fetchUrl: ApiLinks.student_Attendance,
      // pageSize: pageSizeVar,
      // pageNum: counter,
    );

    return StudentAttendanceModel.fromMap(rawData);
  }

// /* -------------------------------------------------------------------------- */
// /*                              //! Fetch by Prop                             */
// /* -------------------------------------------------------------------------- */

  fetchProp(int counter) async {
    var rawData = await _provider.fetchJsonList_by_prop(
      fetchUrl: ApiLinks.student_Attendance,
      // pageSize: pageSizeVar,
      // pageNum: counter,
      // customSearch: 
      );

    return StudentAttendanceModel.fromMap(rawData);
  }

/* -------------------------------------------------------------------------- */
/*                               //! Fetch by id                              */
/* -------------------------------------------------------------------------- */
  // fetchById(modelObj_id) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.user_profile, modelObj_id);

  //   return StudentProfileModel.fromMap(rawData);
  // }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  // profile(modelObj) async {
  //   var rawData = await _provider.fetchSingleJson_by_id(ApiLinks.user_profile, modelObj);
  //   return StudentProfileModel.fromMap(rawData);
  // }

// /* -------------------------------------------------------------------------- */
// /*                                 //! Update                                 */
// /* -------------------------------------------------------------------------- */
//   update(modelObj, modelObj_id) async {
//     var rawData =
//         await _provider.updateApi(updateApiUrl, modelObj, modelObj_id);
//     return UserAcc.fromMap(rawData);
//   }

// /* -------------------------------------------------------------------------- */
// /*                                 //! Delete                                 */
// /* -------------------------------------------------------------------------- */
//   // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
//   delete(modelObjArg_Id) async {
//     var rawData = await _provider.deleteApi(deleteApiUrl, modelObjArg_Id);
//     return rawData; // as api returns string, not a map
//   }
}



/* -------------------------------------------------------------------------- */
/*                          //@ SP Repo class                                 */
/* -------------------------------------------------------------------------- */

// class UserAcc_sp_repo {

//   //Todo : while using sp , make sure to use await , kw , or it wont work
//   // CacheHelper.get('UserAcc');
//   // await CacheHelper.set('UserAcc');
//   // await CacheHelper.remove('UserAcc');

//   set_userAcc(value) async {
//    return await CacheHelper.set('userAcc', value);
//   }

//   //! do not use await in get
//   get_userAcc(key)  {
//    return CacheHelper.get(key);
//   }

//   remove_userAcc(key) async {
//    return await CacheHelper.remove(key);
//   }
// }