// import 'package:bloc_hm_gym/Features/HELPER/___Attendance___/Attendance_fetchProp_module/Attendance_fetchProp_logic/Attendance_fetch_prop_bloc.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// //to change class name = right click on className> Rename symbol
// class ViewAttendance extends StatefulWidget {
//   const ViewAttendance({Key? key}) : super(key: key);

//   @override
//   _ViewAttendanceState createState() => _ViewAttendanceState();
// }

// class _ViewAttendanceState extends State<ViewAttendance> {
//   final ScrollController scrollController = ScrollController();

//   List myStoreList = [];

//   @override
//   void dispose() {
//     scrollController.dispose();
//     myStoreList.clear();
//     super.dispose();
//   }

//   void scrollListener() {
//     if (scrollController.offset >= scrollController.position.maxScrollExtent &&
//         !scrollController.position.outOfRange) {
//       print('list endedddd');
//       Future.delayed(Duration(milliseconds: 100), () {
//         BlocProvider.of<AttendanceFetchPropBloc>(context).add(
//             Attendance_FetchProp_More_onListEnd_Event(
//                 '&recordDate=${myDate.day}-${myDate.month}-${myDate.year}'));
//       });
//     }
//   }

//   DateTime pickedNewValue = DateTime.now();

//   DateTime myDate =
//       DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);

//   int? storeAuid;
//   List storeList = [];

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   fetch_attendance_auid().then((value) {
//   //     storeList = value;
//   //     if (storeList.isEmpty) {
//   //       setState(() {
//   //         print('set state called');
//   //         storeAuid = null;
//   //       });
//   //     } else {
//   //       setState(() {
//   //         //! note = this makes sure only one out of many attendance
//   //         //! marked by single user for a day , is shown
//   //         //! it shown only the first attendance marked for the day
//   //         storeAuid = storeList[0].a_uid;
//   //       });
//   //     }
//   //   });
//   // }

//   // Future fetch_attendance_auid() async {
//   //   return ref.read(providerOfApiHelper).fetchByPropValue_Api(
//   //       getAttendance,
//   //       AttendanceModel.fromMap,
//   //       "recordDate",
//   //       "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}");
//   // }

//   @override
//   void initState() {
//     super.initState();
//     //# a scroll listner which listens always
//     scrollController.addListener(scrollListener);

//     //# bloc init call
//     BlocProvider.of<AttendanceFetchPropBloc>(context).add(
//         Attendance_FetchProp_onInit_Event(
//             '&recordDate=${myDate.day}-${myDate.month}-${myDate.year}'));
//     print('&recordDate=${myDate.day}-${myDate.month}-${myDate.year}');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         appBar: adminHeader(),
//         body: SingleChildScrollView(
//           controller: scrollController,
//           child: Column(
//             children: [
//               showChoosenDate(), //! display currently selected date
//               pickDateCard(), //! pick date widget
//               Divider(),
//               myPagStates() //! fetching from api
//               // myCupertinoDatePicker(),   // not used , but is usable

//               // isDateEntered
//               //     ? fetchStreamCollec_allTimeAttendance()
//               //     : Container(),
//             ],
//           ),
//         ));
//   }

// //! display currently selected date
//   showChoosenDate() {
//     return SizedBox(
//       width: MediaQuery.of(context).size.width,
//       child: Card(
//         child: Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: Text(
//               'Selected date : ${myDate.day} / ${myDate.month} / ${myDate.year}',
//               // maxLines: 2,
//               // overflow: TextOverflow.ellipsis,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.deepPurple,
//                 // decoration: TextDecoration.none,
//                 // fontStyle: FontStyle.italic,
//                 // fontFamily: "FontNameHere" ,
//                 fontWeight: FontWeight.bold,
//                 // fontWeight: FontWeight.w300,
//                 fontSize: 20.0,
//               ),
//             )),
//       ),
//     );
//   }

// //! pick date widget
//   pickDateCard() {
//     var dimVar = MediaQuery.of(context).size;

//     return GestureDetector(
//       onTap: () async {
//         DateTime? myNewDate = await showDatePicker(
//             context: context,
//             initialDate: DateTime.now(),
//             firstDate: DateTime(2022),
//             lastDate: DateTime(2200));

//         if (myNewDate == null) return;
//         setState(() {
//           // isDateEntered = true;
//           myDate = myNewDate;
//           BlocProvider.of<AttendanceFetchPropBloc>(context).add(
//               Attendance_FetchProp_onInit_Event(
//                   '&recordDate=${myDate.day}-${myDate.month}-${myDate.year}'));
//           print('&recordDate=${myDate.day}-${myDate.month}-${myDate.year}');
//         });
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: SizedBox(
//           // height: dimVar.height * 0.08,
//           width: dimVar.width,
//           child: Card(
//             elevation: 10,
//             color: Colors.red,
//             child: Container(
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Colors.blue,
//                 Colors.purpleAccent,
//               ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
//               child: Column(
//                 // mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.fromLTRB(15.0, 15, 8.0, 15),
//                     child: Text(
//                       "Pick a date from here",
//                       // maxLines: 2,
//                       // overflow: TextOverflow.ellipsis,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         // decoration: TextDecoration.none,
//                         // fontStyle: FontStyle.italic,
//                         // fontFamily: "FontNameHere" ,
//                         fontWeight: FontWeight.bold,
//                         // fontWeight: FontWeight.w300,
//                         fontSize: 17.0,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

// //! option date picker ( not used )
//   myCupertinoDatePicker() {
//     return Container(
//       height: 200,
//       child: CupertinoDatePicker(
//         mode: CupertinoDatePickerMode.date,
//         initialDateTime: DateTime(2022, 1, 15),
//         onDateTimeChanged: (DateTime newDateTime) {
//           // Do something
//           setState(() {
//             print('rebuilded');
//             // isDateEntered = true;
//             pickedNewValue = newDateTime;
//           });
//         },
//       ),
//     );
//   }

//   /* -------------------------------------------------------------------------- */
// /*                            //# pagination states                           */
// /* -------------------------------------------------------------------------- */

//   myPagStates() {
//     return BlocConsumer<AttendanceFetchPropBloc, AttendanceFetchPropState>(
//       listener: (context, state) {
//         if (state is Attendance_FetchProp_Error_State) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(
//               backgroundColor: Colors.red,
//               content: Text('Some Network error'),
//             ),
//           );
//         } else if (state is Attendance_FetchProp_More_Loaded_State) {
//           myStoreList.addAll(state.moreModelObjList);
//         }
//       },
//       builder: (context, state) {
//         if (state is Attendance_FetchProp_Loading_State) {
//           return buildLoading();
//         } else if (state is Attendance_FetchProp_Error_State) {
//           return connectionErrorText(state.error);
//         } else if (state is Attendance_FetchProp_Loaded_State) {
//           myStoreList = state.modelObjList;
//           return buildFetchList(myStoreList);
//         }
//         //  else if (state is Attendance_FetchProp_Refreshed_State) {
//         //   return buildFetchList(myStoreList);
//         // }
//         print('default widget');
//         return buildFetchList(myStoreList);
//       },
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                              //# Fetch List UI                             */
// /* -------------------------------------------------------------------------- */

//   buildFetchList(List listArg) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           ListView.builder(
//             shrinkWrap: true,
//             physics: NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             itemCount: myStoreList.length,
//             itemBuilder: (context, i) {
//               return myStoreList.isEmpty
//                   ? showFetchListEmptyMsg()
//                   : Padding(
//                       padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
//                       child: ListTile(
//                         tileColor: Colors.teal,
//                         leading: CircleAvatar(
//                           backgroundColor: Colors.white,
//                         ),
//                         title: Text(
//                           listArg[i].profileName,
//                           maxLines: 1,
//                         ),
//                         // subtitle: Text(
//                         //   listArg[i].body,
//                         //   maxLines: 1,
//                         // ),
//                         onTap: () {
//                           return null;
//                         },
//                       ),
//                     );
//             },
//           ),

//           //# to states to show at end of list
//           BlocConsumer<AttendanceFetchPropBloc, AttendanceFetchPropState>(
//             listener: (context, state) {
//               if (state is Attendance_FetchProp_More_Loaded_ButEmpty_State) {
//                 //! this is imp , as we need to stop listening to scroll controller
//                 //! once there are no more items in the list to fetch
//                 scrollController.dispose();
//               }
//             },
//             builder: (context, state) {
//               if (state is Attendance_FetchProp_More_Loaded_ButEmpty_State) {
//                 return Text('Nothing more to load');
//               } else if (state is Attendance_FetchProp_More_Loading_State) {
//                 return Padding(
//                   padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 20),
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (state is Attendance_FetchProp_More_Error_State) {
//                 return Text(
//                     'Something went wrong, \n Please check your internet');
//               }

//               return Text('');

//               /* -------------------------------------------------------------------------- */
//               /*                //@ if we ever want to use, load more button,               */
//               /* -------------------------------------------------------------------------- */
//               // return TextButton(
//               //   child: Text(
//               //     "Load more ",
//               //     style: TextStyle(color: Colors.white),
//               //   ),
//               //   style: TextButton.styleFrom(backgroundColor: Colors.pink[600]),
//               //   onPressed: () {
//               //     BlocProvider.of<PaginationBloc>(context)
//               //         .add(FetchNew_onListEnd_Event());
//               //   },
//               // );
//             },
//           ),
//         ],
//       ),
//     );
//     // },
//     // );
//   }

//   AppBar adminHeader() {
//     return AppBar(
//       backgroundColor: Colors.white,
//       centerTitle: true,
//       leading: IconButton(
//         icon: Icon(Icons.arrow_back, color: Colors.black),
//         onPressed: () {
//           Navigator.pop(context);
//         },
//       ),
//       title: Text(
//         "View Attendance", //give here appBar title
//         style: TextStyle(color: Colors.black
//             // fontWeight: FontWeight.bold
//             // fontSize: 15,
//             ),
//       ),
//     );
//   }

// /* -------------------------------------------------------------------------- */
// /*                             //# Static widgets                             */
// /* -------------------------------------------------------------------------- */
//   connectionErrorText(error) {
//     return Center(
//       child: Text(
//         'Connection error or \n Error: $error',
//         style: TextStyle(color: Colors.red),
//       ),
//     );
//   }

//   showFetchListEmptyMsg() {
//     return Text(
//       'No Data added yet',
//       style: TextStyle(color: Colors.amber),
//     );
//   }

//   buildLoading() {
//     return Center(
//       child: CircularProgressIndicator(),
//     );
//   }

// //   fetch_api_collection_attendance() {
// // /* -------------------------------------------------------------------------- */
// // /*        //! Fetching any collection , whose path we mention below as req    */
// // /*           //! Displaying fetch Collection using ListView.builder           */
// // /*     //? inside scaffold's body prop , or wherever we want to display       */
// // /* -------------------------------------------------------------------------- */

// //     return FutureBuilder(

// //         //Todo: pass here the fetching url string var stored in global.dart
// //         future: client.get(
// //             Uri.parse(getAttendance +
// //                 "?recordDate=${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}"),
// //             headers: {'authorization': basicAuth}),
// //         builder: (BuildContext context, AsyncSnapshot snapshot) {
// //           if (snapshot.hasError) {
// //             Center(child: Text("Something went wrong: ${snapshot.error}"));
// //           }

// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Center(
// //               child: Center(child: CircularProgressIndicator()),
// //             );
// //           }

// //           if (snapshot.data == null) {
// //             return Text("No data yet");
// //           }
// //           /* -------------------------------------------------------------------------------------- */
// //           /* //!  if data is fetched properly, then store it in docsListName (1 doc = 1 docListName)*/
// //           /* -------------------------------------------------------------------------------------- */
// //           List<AttendanceModel> myNewList = [];

// //           if (snapshot.data.statusCode == 200) {
// //             print('status code 200');
// //             List storeResponse = json.decode(snapshot.data.body);
// //             storeResponse.forEach((element) {
// //               myNewList.add(AttendanceModel.fromMap(element));
// //             });
// //             // setState(() {});
// //           } else {
// //             print('response not fetched - status code != 200');
// //             // throw Exception('Failed to load album');
// //             return Center(
// //               child: Text(
// //                   'Member profile doesnt exisits now \n account must have been deleted'),
// //             );
// //           }

// //           /* -------------------------------------------------------------------------- */
// //           /*  //? displaying all key-values , from docNameList , using ListView.builder */
// //           /* -------------------------------------------------------------------------- */

// //           //Todo: change UI here , and display data as req
// //           return myNewList.isEmpty
// //               ? Center(child: Text('No data'))
// //               : ListView.builder(
// //                   physics: NeverScrollableScrollPhysics(),
// //                   shrinkWrap: true,
// //                   scrollDirection: Axis.vertical,
// //                   itemCount: myNewList.length,
// //                   itemBuilder: (context, i) {
// //                     return Padding(
// //                       padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
// //                       child: ListTile(
// //                         tileColor: Colors.blueAccent,
// //                         //Todo: paste the KEY names ( in 'string') , from firestore documents
// //                         title: Text(myNewList[i].profileName),
// //                         // subtitle: Text(myNewList[i].email!),
// //                         onTap: null,
// //                       ),
// //                     );
// //                   },
// //                 );
// //         });
// //   }

// /* -------------------------------------------------------------------------- */
// /*                        ///# States for zoo_FetchList                       */
// /* -------------------------------------------------------------------------- */
// //   states_for_fetchAttendenceList() {
// //     return BlocConsumer<AttendanceFetchPropBloc, AttendanceFetchPropState>(
// //       listener: (context, state) {
// //         if (state is Attendance_FetchProp_Error_State) {
// //           ScaffoldMessenger.of(context).showSnackBar(
// //             SnackBar(
// //               backgroundColor: Colors.red,
// //               content: Text('Some Network error'),
// //             ),
// //           );
// //         }
// //       },
// //       builder: (context, state) {
// //         if (state is Attendance_FetchProp_Error_State) {
// //           return connectionErrorText(state.error);
// //         } else if (state is Attendance_FetchProp_Loading_State) {
// //           return buildLoading();
// //         } else if (state is Attendance_FetchProp_Loaded_State) {
// //           return buildFetchList(state.modelObjList);
// //         }
// //         return buildLoading();
// //       },
// //     );
// //   }

// // /* -------------------------------------------------------------------------- */
// // /*                              //# Fetch List UI                             */
// // /* -------------------------------------------------------------------------- */

// //   buildFetchList(listArg) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: ListView.builder(
// //         shrinkWrap: true,
// //         physics: NeverScrollableScrollPhysics(),
// //         scrollDirection: Axis.vertical,
// //         itemCount: listArg.length,
// //         itemBuilder: (context, i) {
// //           return

// //               // this throws error for some reason
// //               // listArg.isEmtpy
// //               //     ? showFetchListEmptyMsg()
// //               //     :
// //               ListTile(
// //             tileColor: Colors.blueAccent,
// //             title: Text(listArg[i].profileName),
// //             // subtitle: Text(listArg[i].password),
// //             onTap: () {
// //               return null;
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }

// }
