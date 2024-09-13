import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String txt;
  final VoidCallback onPressed;
  const StartButton({
    super.key,
    required this.txt,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 60,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
          backgroundColor: const Color(0xFF6C63FF), 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          shadowColor: Colors.black.withOpacity(0.3),
          elevation: 8, // Adds shadow effect
        ),
        child: Text(
          txt,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}