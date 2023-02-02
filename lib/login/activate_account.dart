import 'package:ditto/routes.dart' show route, addRoute;
import 'package:ditto/login/bg.dart';
import 'package:flutter/material.dart';

class activateAccount extends StatelessWidget {
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

void activateAccountPop(BuildContext context) {
  if (route.containsKey("/activateAccount") == false) {
    addRoute("/activateAccount", activateAccount());
  }
  Navigator.pushNamed(context, "/activateAccount");
}
