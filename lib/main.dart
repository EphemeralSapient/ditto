import 'package:ditto/global.dart';
import 'package:ditto/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:ditto/routes.dart' show route, addRoute;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    addRoute("/", const processUi());
    return MaterialApp(
        //home: processUi(),
        initialRoute: '/',
        routes: Map.from(route),
        onGenerateRoute: (settings) {
          // In case route doesn't exist since routes table doesn't get update
          if (route.containsKey(settings.name)) {
            debugPrint(
                "${settings.name} route was called | ${StackTrace.current}");
            return PageRouteBuilder(
              settings:
                  settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
              pageBuilder: (c, a1, a2) => route[settings.name]!(c),
              transitionsBuilder: (c, anim, a2, child) =>
                  FadeTransition(opacity: anim, child: child),
              transitionDuration: const Duration(milliseconds: 500),
            );
          }
          debugPrint(settings.name);
          return null;
          // Unknown route
          //return MaterialPageRoute(builder: (_) => UnknownPage());
        });
  }
}

class processUi extends StatelessWidget {
  const processUi({super.key});

  @override
  Widget build(BuildContext context) {
    return const login_screen();
  }
}
