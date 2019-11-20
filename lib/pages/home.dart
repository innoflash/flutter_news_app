import 'package:flutter/material.dart';
import 'package:news_app/utils/constants.dart';

class NewsIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            left: Constants.DIMEN_10, right: Constants.DIMEN_10),
        height: double.infinity,
        width: double.infinity,
        color: Color.fromRGBO(242, 229, 229, .75));
  }
}