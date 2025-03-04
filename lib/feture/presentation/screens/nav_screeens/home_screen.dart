import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_application/core/constant/assetsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/core/constant/stringHelper.dart';
import 'package:food_application/feture/presentation/widgets/custom_Listviewbuilder.dart';
import 'package:food_application/feture/presentation/widgets/custom_category.dart';
import 'package:food_application/feture/presentation/widgets/custom_gridview.dart';
import 'package:food_application/feture/presentation/widgets/custom_search.dart';
import 'package:food_application/feture/presentation/widgets/custom_single_food.dart';
import 'package:food_application/feture/presentation/widgets/custom_text.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int cIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(DimensionHelper.dimens_30),child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AssetsHelper.logo,height: DimensionHelper.dimens_70.h,width: DimensionHelper.dimens_150,fit: BoxFit.contain,),
                    CustomText(text: StringHelper.orderFF,color: Colors.grey.shade500,)
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(DimensionHelper.dimens_30.r),
                  child: Image.asset(AssetsHelper.boy,height: DimensionHelper.dimens_90),
                )
              ],
            ),
            SizedBox(height: DimensionHelper.dimens_20.h,),
            CustomSearch(
              callback: () {
              },
              hintText: StringHelper.searchYFFH,
            ),
            SizedBox(height: DimensionHelper.dimens_24.h,),
            CustomListviewbuilder(
              height: 80,
              itemCount: 10,
              itemBuider: (_,index) {
                return CustomCategory(
                  index: index,
                  cIndex: cIndex,
                  callback: () {
                    setState(() {
                      cIndex = index;
                    });
                  },
                  image: AssetsHelper.burger,
                  name: "Burger",
                );
              },
            ),
            SizedBox(height: DimensionHelper.dimens_30.h,),
            CustomGridview(itemCount: 10, itemBuilder: (_, index) {
              return CustomSingleFood(
                callback: () {
                  context.go("/details");
                },
                image: AssetsHelper.pizz1,
                title: "Cheese Pizza",
                price: "399",
              );
            },)
          ],
        ),),
      ),
    );
  }
}
