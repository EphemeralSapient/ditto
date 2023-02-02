import 'package:ditto/routes.dart' show route, addRoute;
import 'package:ditto/login/bg.dart';
import 'package:flutter/material.dart';

class activateAccount extends StatelessWidget {
  TextEditingController mobileNum = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bg(
        child: Column(children: [
      Padding(
          padding:
              const EdgeInsets.only(top: 25, left: 20, right: 20, bottom: 10),
          child: Column(
            children: [
              const Text("ACTIVATION OF ACCOUNT",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: mobileNum,
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(color: Colors.grey),
                    labelText: "Mobile Number"),
              ),
            ],
          )),
      SizedBox(
        height: 30,
      ),
      MyElevatedButton(
          width: double.infinity,
          onPressed: () {},
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.cyan, Colors.cyan, Colors.blue]),
          child: const Text(
            'SEND',
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      SizedBox(
        height: 30,
      ),
      Center(
        child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Text("You have an account? Login")),
      )
    ]));
  }
}

void activateAccountPop(BuildContext context) {
  if (route.containsKey("/activateAccount") == false) {
    addRoute("/activateAccount", activateAccount());
  }
  Navigator.pushNamed(context, "/activateAccount");
}

class MyElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.gradient = const LinearGradient(colors: [Colors.cyan, Colors.indigo]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 5.0,
            spreadRadius: 0.5,
            offset: Offset(0, 5),
          )
        ],
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
