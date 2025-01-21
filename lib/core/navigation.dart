import 'package:flutter/material.dart';

Future navigateTo(BuildContext context, {required Widget page}) async {
  return Navigator.of(context).push(
    MaterialPageRoute(
      builder: (BuildContext context) => page,
    ),
  );
}
