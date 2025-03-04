import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/fontsHelper.dart';

class CustomTextfield extends StatelessWidget {
  final String ? Function(String?)?validatore;
  final TextEditingController? controller;
  final String? hintText;
  final bool hide;
  final IconData ?preIcon;
  final Widget ?suffixIcon;
  final TextInputType ?inputType;
  const CustomTextfield({super.key,  this.validatore,  this.controller, this.hintText, this.hide = false, this.inputType, this.preIcon, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: DimensionHelper.dimens_20.sp),
      height: DimensionHelper.dimens_60.h,
      width: DimensionHelper.dimens_all,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(DimensionHelper.dimens_20.r)
      ),
      child: TextFormField(
        cursorWidth: 3,
        validator: validatore,
        controller: controller,
        obscureText: hide,
        keyboardType: inputType,
        style: TextStyle(color: Colors.black,fontSize: FontHelper.font_22,fontWeight: FontHelper.medium),
        decoration: InputDecoration(
          prefixIcon: Icon(preIcon,size: DimensionHelper.dimens_50.sp,color: Colors.green,),
            errorBorder: OutlineInputBorder(borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide.none),
            suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          border: OutlineInputBorder(borderSide: BorderSide.none),

          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: FontHelper.font_24,
          )
        ),
      ),
    );
  }
}
