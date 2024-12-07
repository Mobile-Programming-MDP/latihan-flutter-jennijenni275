import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Contoh Animasi Lottie'),
        ),
        body: Center(
          child: LoadingAnimationWidget.staggeredDotsWave(
            leftDotColor: const Color(0xFF1A1A3F),
            rightDotColor: const Color(0xFFEA3799),
            size: 200,
          ),
        ),
     ),
);
}
}