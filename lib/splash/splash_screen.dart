import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:gesco/registration/school_manager/log_in/log_in_screen.dart';
import 'package:gesco/registration/school_manager/log_up/log_up_screen.dart';
import 'package:lottie/lottie.dart';
import '../constantes.dart';
import '../services/shared_preferences_service.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = 'splash_screen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferencesService sharedPreferencesService = SharedPreferencesService();
  late Widget currentScreen;

  @override
  void initState() {
    super.initState();
    sharedPreferencesService.setFirstInteraction(true);
    currentScreen = LogInScreen();
    initNextScreen();
  }

  void initNextScreen() async {
    bool? isFirstInteraction = await sharedPreferencesService.isFirstInteraction();
    if (isFirstInteraction == null || isFirstInteraction) {
      setState(() {
        currentScreen = LogUpScreen();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimatedSplashScreen(
              splash: Lottie.asset('animations/book.json'),
              splashIconSize: 900,
              duration: 3000,
              backgroundColor: kPrimaryColor,
              nextScreen: currentScreen,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width*0.7,
            child: const LinearProgressIndicator(
              //value: 0.7,
              color: Colors.blue,
              backgroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 200,)
        ],
      ),
    );
  }
}