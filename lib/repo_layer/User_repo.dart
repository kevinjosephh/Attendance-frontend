import 'dart:convert';

import '../service_layer/models/ClassModel.dart';
import '../service_layer/models/UserModel.dart';
import '../service_layer/models/UserModelV2.dart';
import '../service_layer/services/ApiHelper.dart';
import '../service_layer/services/SharedPreferences_helper.dart';
import '../service_layer/services/secret_credentials/global.dart';

class User_api_repo {
  //Todo : (IMP) All functions of this class must be await , or else wont work
  //Todo : make sure to include JsonList method in modelClass from snipit.io

/* -------------------------------------------------------------------------- */
/*                               //! Field vars                               */
/* -------------------------------------------------------------------------- */

  // to access funcs of api service class here
  final _provider = ApiHelper.ApiHelperObj;

  int pageSizeVar = 15; // used in pagination of fetches

/* -------------------------------------------------------------------------- */
// /*                                //! Fetch All                               */
// /* -------------------------------------------------------------------------- */
  fetchAll() async {
    var rawData = await _provider.fetchJsonList(
      fetchUrl: ApiLinks.students,
      // pageSize: pageSizeVar,
      // pageNum: counter,
    );

    return UserModel.fromMapList(rawData);
  }

  teacherfetchAll() async {
    var rawData = await _provider.fetchJsonList(
      fetchUrl: ApiLinks.teachers,
      // pageSize: pageSizeVar,
      // pageNum: counter,
    );

    return UserModel.fromMapList(rawData);
  }

// /* -------------------------------------------------------------------------- */
// /*                              //! Fetch by Prop                             */
// /* -------------------------------------------------------------------------- */

//   fetchProp(int counter) async {
//     var rawData = await _provider.fetchJsonList_by_prop(
//       fetchUrl: someUrl,
//       pageSize: pageSizeVar,
//       pageNum: counter,
//       customSearch: );

//     return MODE_CLASS_NAME.fromMapList(rawData);
//   }

// /* -------------------------------------------------------------------------- */
// /*                               //! Fetch by id                              */
// /* -------------------------------------------------------------------------- */
//   fetchById(modelObj_id) async {
//     var rawData = await _provider.fetchSingleJson_by_id(fetchUrl, modelObj_id);

//     return MODEL_CLASS_NAME.fromMap(rawData);
//   }

/* -------------------------------------------------------------------------- */
/*                                 //! Create                                 */
/* -------------------------------------------------------------------------- */
  login(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.user_login, modelObj);
    if (rawData is String) {
      print(rawData);
      return rawData;
    }
    return UserModel.fromMap(rawData);
  }

  register(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.user_register, modelObj);
    if (rawData is String) {
      return rawData;
    }
    return UserModelV2.fromMap(rawData);
  }

  teacher_register(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.teacher_register, modelObj);
    if (rawData is String) {
      return rawData;
    }
    return UserModelV2.fromMap(rawData);
  }

  classregister(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.class_register, modelObj);
    if (rawData is String) {
      return rawData;
    }
    return ClassModel.fromMap(rawData);
  }

  attendance(modelObj) async {
    var rawData = await _provider.addApi(ApiLinks.student_Attendance, modelObj);
    print("ji");
    print(rawData);
    return rawData;
  }
/* -------------------------------------------------------------------------- */
/*                                 //! Update                                 */
/* -------------------------------------------------------------------------- */
//   update(modelObj, modelObj_id) async {
//     var rawData =
//         await _provider.updateApi(updateApiUrl, modelObj, modelObj_id);
//     return MODEL_CLASS_NAME.fromMap(rawData);
//   }

// /* -------------------------------------------------------------------------- */
// /*                                 //! Delete                                 */
// /* -------------------------------------------------------------------------- */
//   // doesnt return a map, just some string ( so can't use AccountModel.fromJson)
//   delete(modelObjArg_Id) async {
//     var rawData = await _provider.deleteApi(deleteApiUrl, modelObjArg_Id);
//     return rawData; // as api returns string, not a map
//   }
// }

// /* -------------------------------------------------------------------------- */
// /*                          //@ SP Repo class                                 */
// /* -------------------------------------------------------------------------- */
}

class User_sp_repo {
  //Todo : while using sp , make sure to use await , kw , or it wont work
  // CacheHelper.get('UserAcc');
  // await CacheHelper.set('UserAcc');
  // await CacheHelper.remove('UserAcc');

  set_user(value) async {
    return await CacheHelper.set('user', value);
  }

  //! do not use await in get
  get_user(key) {
    return CacheHelper.get(key);
  }

  get_model_user(key) {
    String model = CacheHelper.getModel(key);
    return UserModel.fromJson(model);
  }

  remove_user(key) async {
    return await CacheHelper.remove(key);
  }
}
