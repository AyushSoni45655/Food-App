import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';

class CustomListviewbuilder extends StatelessWidget {
  final Widget ? Function(BuildContext,int)itemBuider;
  final double ?height;
  final int itemCount;
  final Axis ?axis;
  const CustomListviewbuilder({super.key, required this.itemBuider, required this.itemCount,  this.height = DimensionHelper.dimens_150, this.axis});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(
        ),
        primary: true,
          scrollDirection: axis?? Axis.horizontal,
          itemBuilder: itemBuider,
        itemCount: itemCount,
      ),
    );
  }
}
