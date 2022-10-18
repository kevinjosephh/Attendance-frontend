import 'package:flutter/material.dart';

class MyComponents {
  static errorSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        content: Text(text),
      ),
    );
  }

  static successSnackBar(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        content: Text(text),
      ),
    );
  }

  static showFetchListEmptyMsg() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'No Data',
          // maxLines: 2,
          // overflow: TextOverflow.ellipsis,
          // textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            // decoration: TextDecoration.none,
            // fontStyle: FontStyle.italic,
            // fontFamily: "FontNameHere" ,
            fontWeight: FontWeight.bold,
            // fontWeight: FontWeight.w300,
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }

  static nothingMoreToLoad() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('Nothing more to load'),
    );
  }

  static emptyText() {
    return Text('');
  }

  static buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
