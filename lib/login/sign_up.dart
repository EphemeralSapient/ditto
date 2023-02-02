import 'package:ditto/routes.dart' show route, addRoute;
import 'package:ditto/login/bg.dart';
import 'package:flutter/material.dart';

class signUp extends StatelessWidget {
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

void signupPop(BuildContext context) {
  if (route.containsKey("/signUp") == false) {
    addRoute("/signUp", signUp());
  }
  Navigator.pushNamed(context, "/signUp");
}
