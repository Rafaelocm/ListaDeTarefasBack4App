import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:estudobackapp/pages/tarefa_page.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.purple],
            stops: [0.3, 0.7]), 
        ),
        child:  Center(child: AnimatedTextKit(
          totalRepeatCount: 1,
          repeatForever: false,
          onFinished: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TarefasPage(),));
          },
      animatedTexts: [
      FadeAnimatedText('Olá', textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
      FadeAnimatedText('Seja bem vindo', textStyle: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
    ],
    pause: const Duration(milliseconds: 200),
    isRepeatingAnimation: true,
    stopPauseOnTap: true,

    onTap: () {
      print("Tap Event");
    },
  ),),
      ),
    ));
  }
}