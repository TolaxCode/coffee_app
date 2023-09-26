import 'package:flutter/cupertino.dart';

void nextScreen(context, page) {
  Navigator.push(
    context,
    CupertinoPageRoute(
      maintainState: true,
      builder: (context) => page,
    ),
  );
}
