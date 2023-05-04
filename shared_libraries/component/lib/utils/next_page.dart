import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void nextPage(context, page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

void nextPageiOS(context, page) {
  Navigator.push(context, CupertinoPageRoute(builder: (context) => page));
}

void nextPageReplace(context, page) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => page));
}

void nextPagePopup(context, page) {
  Navigator.push(
    context,
    MaterialPageRoute(fullscreenDialog: true, builder: (context) => page),
  );
}

void nextPageRemoveUntil(context, page) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => page), (route) => false);
}
