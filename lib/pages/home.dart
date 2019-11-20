import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/utils.dart';
import 'dart:async';

class NewsIndex extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsIndex> {
  BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context = context;
    return Container(
        padding: EdgeInsets.only(
            left: Constants.DIMEN_10, right: Constants.DIMEN_10),
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(242, 229, 229, .75));
  }

  @override
  Future initState() async {
    print('this has just been initialized');

    ///   Utils.showAlert(context, message: "This is an alert message", onClose: () {
    ///     print('close clicked');
    ///   });

    var connectivityResult = await Connectivity().checkConnectivity();
  }
}
