import 'package:flutter/material.dart';
import 'package:quran_book/core/style/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String name;

  const TextFieldWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      hintText: name,
      labelStyle:
          TextStyle(color: AppColors.c_8789a3, fontWeight: FontWeight.bold),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.c_8789a3, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: AppColors.c_8789a3, width: 1),
      ),
    ));
  }
}
