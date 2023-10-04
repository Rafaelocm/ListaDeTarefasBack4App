import 'package:easy_localization/easy_localization.dart';
import 'package:estudobackapp/pages/home_page.dart';
import 'package:estudobackapp/pages/splash_screen.dart';
import 'package:estudobackapp/pages/splash_screen_delay.dart';
import 'package:estudobackapp/pages/tarefa_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.blue),
      home:  const HomePage(),
      
    );
  }
}
