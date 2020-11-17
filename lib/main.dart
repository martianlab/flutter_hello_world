import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hello_world/constants.dart';
import 'package:flutter_hello_world/screens/home/home_screen.dart';

import 'interactor/platform/platform.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodplex Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: SplashRouterWidget(), //HomeScreen(),
    );
  }
}

/// Widget for initial routing base on the current session state
class SplashRouterWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashRouterState();
  }
}


class SplashRouterState extends State {
  static const platform = const MethodChannel(METHOD_CHANNEL_NAME);

  @override
  void initState() {
    _firstLaunchCheck().then((bool hasAccount) {
      if (hasAccount) {
        //_signInToLastSession().then(
        //      (_) => _openProjectsListScreen(),
        //);
      } else {
        //_openAuthScreen();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }

  Future<bool> _firstLaunchCheck() async {
    bool _hasAccount;
    try {
      _hasAccount = await platform.invokeMethod('firstLaunchCheck');
    } on PlatformException catch (_) {
      // do nothing
    }
    return _hasAccount;
  }

  /// Sign in to last session via platform SDK
  //Future<void> _signInToLastSession() async {
  //  try {
  //    await platform.invokeMethod('signInToLastSession');
  //  } catch (_) {
  //    // do nothing
  //  }
  //}

  /// Navigate to the [ProjectsListScreen].
  //void _openAuthScreen() {
  //  Navigator.pushReplacement(
  //    context,
  //    MaterialPageRoute(
  //      builder: (context) => AuthScreen(),
  //    ),
  //  );
  //}

  /// Navigate to the [ProjectsListScreen].
  //void _openProjectsListScreen() {
  //  Navigator.pushReplacement(
  //    context,
  //    MaterialPageRoute(
  //      builder: (context) => ProjectsListScreen(),
  //    ),
  //  );
  //}
}
