import 'package:flutter/material.dart';
import 'package:quizler/screens/start_screen.dart';

void main(){
  return runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    )
  );
}
