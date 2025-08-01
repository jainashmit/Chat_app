import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String hint;
  AppTextField({super.key , required this.hint});

  @override
  Widget build(BuildContext context) {
    return TextField(
      
      decoration: InputDecoration(
        hintText: hint,
        labelText: hint,
          border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        filled: true,
        fillColor: const Color.fromARGB(128, 255, 255, 255),
      ),
    );
 }
}

