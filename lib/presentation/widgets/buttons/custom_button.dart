import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final void Function() onPressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.width ,
    required this.height ,
    this.color = Colors.blue,
    required this.onPressed,
    required this.text,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ,
      height: height ,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        ),
        child: Text(text),
      ),
    );
  }
}





