import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.buttonText, this.onTap, this.color, this.textColor});
  final String? buttonText;
  final Widget? onTap;
  final Color? color;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  onTap!,
          ),
        );
      },
      child: Container(
        padding:const  EdgeInsets.all(30),
        decoration: BoxDecoration(
            color: color!,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(50),
            )),
        child: Text(
          buttonText!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor!,
          ),
        ),
      ),
    );
  }
}
