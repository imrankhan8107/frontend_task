import 'package:flutter/material.dart';

showSnackBar(String content, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(content),
  ));
}

const kAppBarTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w600,
  color: Color(0xff6962AD)
);

const kCardTextDecor = TextStyle(
  color: Color(0xff6C22A6),
  fontWeight: FontWeight.w700,
  fontSize: 20,
);

const kCardSubtextDecor = TextStyle(
  color: Color(0xff6962AD),
  fontWeight: FontWeight.w500,
  fontSize: 15,
);