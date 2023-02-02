import 'package:flutter/material.dart';
import 'package:indexed/indexed.dart';

class bg extends StatelessWidget {
  final Widget child;

  const bg({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Indexer(
        clipBehavior: Clip.none,
        children: [
          Indexed(
            index: 3,
            child: Positioned(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.125,
              top: MediaQuery.of(context).size.height * 0.05,
              left: MediaQuery.of(context).size.width * 0.25,
              child: CircleAvatar(
                  radius: 1,
                  child: Image.asset('public/company_placeholder.webp')),
            ),
          ),
          Indexed(
            index: 2,
            child: Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: MediaQuery.of(context).size.width * 0.075,
              width: MediaQuery.of(context).size.width * 0.85,
              height: MediaQuery.of(context).size.width * 1.4,
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: child,
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
