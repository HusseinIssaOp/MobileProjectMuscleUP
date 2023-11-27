import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// media queryyy

class MyTextFieldWidget extends StatelessWidget {
  final String hint;
  final Function(String) f;
  const MyTextFieldWidget({required this.hint, required this.f, super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 0.8;
    }
    return Center(
      child: SizedBox(
          width: 300,
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],
            style: const TextStyle(fontSize: 20),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: hint,
            ),
            onChanged: (text) => f(text),
          )),
    );
  }
}
