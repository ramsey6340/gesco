import 'package:flutter/cupertino.dart';
import 'package:gesco/registration/school_manager/log_in/log_in_screen.dart';
import 'package:gesco/registration/school_manager/log_up/log_up_screen.dart';
import 'package:gesco/splash/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  LogUpScreen.routeName:  (context) => LogUpScreen(),
  SplashScreen.routeName: (context) => SplashScreen(),
  LogInScreen.routeName:  (context) => LogInScreen(),
};