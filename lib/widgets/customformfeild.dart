import 'package:flutter/material.dart';

class Customformfeild extends StatelessWidget {
  Customformfeild(
      {super.key,
      this.icon,
      this.onChanged,
      this.hintText,
      required this.labeltext});
  Function(String)? onChanged;
  String? hintText;
  final IconData? icon;
  Widget labeltext;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'field is required';
        }
        return null;
      },
      // (data) {
      //         email = data;
      //       },
      decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
        ),
        label: labeltext,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.black26,
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
