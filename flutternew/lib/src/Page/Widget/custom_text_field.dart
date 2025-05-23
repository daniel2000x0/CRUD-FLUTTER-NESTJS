import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
   final String label;
  final TextEditingController controller;
  final TextInputType keyboardType; 
    const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  // textfield  personalizado  opcional 
@override

  Widget build(BuildContext context) {
  return Padding(  padding: const EdgeInsets.symmetric(vertical: 8.0),
  child:Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextFormField(
            controller: controller,
            keyboardType: keyboardType,
          ),
        ],
  ),
   );
  }

}