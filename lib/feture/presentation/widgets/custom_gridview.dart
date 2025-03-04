import 'package:flutter/cupertino.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';

class CustomGridview extends StatelessWidget {
  final int itemCount;
  final Widget? Function (BuildContext,int)itemBuilder;
  const CustomGridview({super.key, required this.itemCount, required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 371,
        crossAxisSpacing: DimensionHelper.dimens_20,
        mainAxisSpacing: DimensionHelper.dimens_20,
      ),
      physics: BouncingScrollPhysics(),
      shrinkWrap: true,
      primary: true,
      scrollDirection: Axis.vertical,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
