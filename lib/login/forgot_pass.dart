import 'package:ditto/routes.dart' show route, addRoute;
import 'package:ditto/login/bg.dart';
import 'package:flutter/material.dart';

class forgotpass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return bg(
        child: Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Close"))));
  }
}

void forgotpassPop(BuildContext context) {
  if (route.containsKey("/forgotpass") == false) {
    addRoute("/forgotpass", forgotpass());
  }
  Navigator.pushNamed(context, "/forgotpass");
}
