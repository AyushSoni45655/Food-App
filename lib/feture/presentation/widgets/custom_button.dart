import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/fontsHelper.dart';

class CustomButton extends StatelessWidget {
  final double ?height;
  final double ?width;
  final String? text;
  final bool  cText;
  final Color ?color;
  final VoidCallback? callback;
  CustomButton({super.key, this.height = 50, this.width = DimensionHelper.dimens_all, this.text, this.callback, this.cText = true, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: cText?null:Border.all(color: CupertinoColors.black,width: 2),
        color: cText?color??ColorsHelper.blackColor:ColorsHelper.transparent,
        borderRadius: BorderRadius.circular(DimensionHelper.dimens_20.r)
      ),
      child: Center(child: Text(text??"",textAlign: TextAlign.center,style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: FontHelper.font_36,
        color:cText? CupertinoColors.white:CupertinoColors.black
      ),),),
    );
  }
}
