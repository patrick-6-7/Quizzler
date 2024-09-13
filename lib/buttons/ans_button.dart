import 'package:flutter/material.dart';

class AnsButton extends StatelessWidget {

  final Color color;
  final String txt;
  final VoidCallback onPressed;

  const AnsButton({
    super.key,
    required this.color,
    required this.txt,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed, 
      child: Container(
        width: 300,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25
            ),
          ),
        ),
      )
    );
  }
}