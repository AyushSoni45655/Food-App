import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String ?text;
  final TextAlign ?textAlign;
  final Color ?color;
  final VoidCallback ? callback;
  final AlignmentGeometry ?alignment;
  final double ?fontsize;
  final FontWeight ?fontWeight;

   CustomText({super.key, this.text, this.color, this.alignment, this.fontWeight, this.callback, this.textAlign, this.fontsize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        alignment: alignment,
        child: Text(text??'',style: TextStyle(
          color: color?? Colors.black,
          fontSize: fontsize??26,
          fontWeight: fontWeight??FontWeight.bold
        ),
          textAlign: textAlign??TextAlign.center,
        ),
      ),
    );
  }
}
