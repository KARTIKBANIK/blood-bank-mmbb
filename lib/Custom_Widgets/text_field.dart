import 'package:flutter/material.dart';

class MyTExtField extends StatelessWidget {
  final lebelText;

  final hintText;
  final controller;

  MyTExtField({
    super.key,
    this.lebelText,
    this.hintText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: lebelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(22),
          ),
        ),
      ),
    );
  }
}
