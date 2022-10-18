import 'package:attendance/screens/Profile/StudentProfile.dart';
import 'package:flutter/material.dart';

class Student_fetch_listTile_widget extends StatelessWidget {
  final singleObj;
  const Student_fetch_listTile_widget({super.key, required this.singleObj});

  @override
  Widget build(BuildContext context) {
    return listTile(context);
  }

  listTile(context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 1, 8.0, 1),
      child: ListTile(
        tileColor: Colors.teal,
        // leading: tile_leading(),
        title: tile_title(),
        subtitle: tile_subtitle(),
        onTap: () {Navigator.push(context,
              MaterialPageRoute(builder: (context) {
            return StudentProfile_Screen(singleObj:singleObj);
          }));}
      ),
    );
  }

  tile_leading() {
    return CircleAvatar(
      backgroundColor: Colors.white,
      child: Text(singleObj.id.toString()),
    );
  }

  tile_title() {
    return Text(
      singleObj.first_name+' '+singleObj.last_name,
      maxLines: 1,
    );
  }

  tile_subtitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          singleObj.roll_no ,
          maxLines: 1,
        ),
        // SizedBox(
        //   height: 80,
        // )
      ],
    );
  }

/* -------------------------------------------------------------------------- */
/*                             //@ Functionalities                            */
/* -------------------------------------------------------------------------- */
  buildFetchObj(modelObj) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                    'https://www.pngitem.com/pimgs/m/22-223968_default-profile-picture-circle-hd-png-download.png'),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.account_box_rounded,
                      ),
                      Text("Name: ",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(modelObj.first_name + " " + modelObj.last_name,
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                ),
                // Text(""+modelObj.last_name),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.confirmation_number_rounded,
                      ),
                      Text("ID No: ",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(modelObj.roll_no,
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.class_,
                      ),
                      Text("Class: ",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(modelObj.class_name,
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.email,
                      ),
                      Text("Email: ",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                      Text(modelObj.email,
                          style:
                              TextStyle(fontSize: 18, color: Colors.black54)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  fetchListFunc(context, listTileInfo) async {
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return AdminVerifyScreen();
    // }));
  }
}
