import 'package:gesco/providers/log_up_current_page_provider.dart';
import 'package:gesco/routes.dart';
import 'package:gesco/splash/splash_screen.dart';
import 'package:gesco/test/test.dart';
import 'package:gesco/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LogUpCurrentPageProvider()),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.getTheme(),
      //home: ProcessTimelinePage(),
      title: 'Gesco',
      routes: routes,
      initialRoute: SplashScreen.routeName,
    );
  }
}

