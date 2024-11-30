import 'package:flutter/material.dart';

class CustomPasswordField extends StatefulWidget {
  CustomPasswordField({super.key, this.onChanged, required this.controller,this.hintText, required this.labeltext});
  Function(String)? onChanged;
  final TextEditingController controller;  String? hintText;
  Widget labeltext;


  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: obscureText,
      obscuringCharacter: '*',
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter Password';
        }
        return null;
      },
      decoration: InputDecoration(
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });

            },
            child: obscureText
                ? const Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  )
                : const Icon(Icons.visibility, color: Colors.red),
          ),
          label: widget.labeltext,
          hintText: widget.hintText,
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
          )),
    );
  }
}
