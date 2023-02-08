import 'package:ditto/login/activate_account.dart';
import 'package:ditto/login/forgot_pass.dart';
import 'package:ditto/login/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:indexed/indexed.dart';

class login_screen extends StatefulWidget {
  const login_screen({super.key});

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  bool _passwordVisible = false;
  TextEditingController mobileNum = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Indexer(
        clipBehavior: Clip.none,
        children: [
          // Logo
          Indexed(
            index: 3,
            child: Positioned(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.3,
              top: MediaQuery.of(context).size.height * 0.1,
              left: MediaQuery.of(context).size.width * 0.25,
              child: CircleAvatar(
                  radius: 1,
                  child: Image.asset('public/company_placeholder.webp')),
            ),
          ),
          // Card
          Indexed(
            index: 2,
            child: Positioned(
              top: MediaQuery.of(context).size.height * 0.415,
              left: MediaQuery.of(context).size.width * 0.075,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 1,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 25, left: 20, right: 20, bottom: 10),
                      child: Column(
                        children: [
                          const Text("LOGIN",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            controller: mobileNum,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                floatingLabelAlignment:
                                    FloatingLabelAlignment.center,
                                alignLabelWithHint: true,
                                labelStyle: TextStyle(color: Colors.grey),
                                labelText: "Mobile Number"),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TextField(
                            textAlign: TextAlign.center,
                            controller: password,
                            obscureText: !_passwordVisible,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(4),
                            ],
                            decoration: InputDecoration(
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              alignLabelWithHint: true,
                              suffixIcon: Material(
                                color: Colors.transparent,
                                borderOnForeground: false,
                                child: IconButton(
                                  splashColor: Colors.grey,
                                  splashRadius: 120,
                                  icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    !_passwordVisible
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    // Update the state i.e. toogle the state of passwordVisible variable
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                ),
                              ),
                              labelStyle: const TextStyle(color: Colors.grey),
                              labelText: "4 Digit Password",
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    //
                    //
                    MyElevatedButton(
                        width: double.infinity,
                        onPressed: () {},
                        borderRadius: BorderRadius.circular(20),
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,
                            colors: [Colors.cyan, Colors.cyan, Colors.blue]),
                        child: const Text(
                          'LOGIN',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?  ",
                          style: TextStyle(color: Colors.grey),
                        ),
                        InkWell(
                          onTap: () {
                            signupPop(context);
                          },
                          child: const Text("Register Now",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 89, 255),
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),

                    const SizedBox(height: 25),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
                              forgotpassPop(context);
                            },
                            child: const Text("Forgot Password?")),
                        InkWell(
                            onTap: () {
                              activateAccountPop(context);
                            },
                            child: const Text("Activate Account?"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          // Background radial blue circle
          Indexed(
            index: 1,
            child: Positioned(
              left: -MediaQuery.of(context).size.width * 0.5,
              //bottom: MediaQuery.of(context).size.height,
              top: -MediaQuery.of(context).size.height * 0.75,
              width: MediaQuery.of(context).size.width * 2,
              height: MediaQuery.of(context).size.height * 2,
              child: Container(
                decoration: const BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Color.fromARGB(255, 0, 171, 250),
                        Color.fromRGBO(3, 235, 255, 1),
                      ],
                      radius: 1.0,
                    ),
                    color: Colors.blue,
                    shape: BoxShape.circle),
              ),
            ),
          )
        ],
      ),
    );
  }
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
