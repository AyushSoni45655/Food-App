import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_application/core/constant/colorsHelper.dart';
import 'package:food_application/core/constant/dimensionHelper.dart';
import 'package:food_application/feture/presentation/blocs/nav/navigation_bloc.dart';
import 'package:food_application/feture/presentation/screens/nav_screeens/home_screen.dart';
import 'package:food_application/feture/presentation/screens/nav_screeens/order_screen.dart';
import 'package:food_application/feture/presentation/screens/nav_screeens/profile_screen.dart';
import 'package:food_application/feture/presentation/screens/nav_screeens/wallet_screen.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
   int cIndex = 0;
  List<Widget>screens = [
    HomeScreen(),
    OrderScreen(),
    WalletScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc,NavigationState>(
          builder: (context, state) {
            if(state is NavigationToggleState){
              cIndex = state.cIndex;
            }
            return screens[cIndex];
          },
      )
      ,
      bottomNavigationBar: BlocBuilder<NavigationBloc,NavigationState>(
        builder: (context, state){
          if(state is NavigationToggleState){
            cIndex = state.cIndex;
          }
          return CurvedNavigationBar(
            animationCurve: Curves.easeIn,
              animationDuration: Duration(milliseconds: 500),
              backgroundColor: ColorsHelper.whiteColor,
              color: ColorsHelper.blackColor,
              index: cIndex,
              onTap: (value) {
                context.read<NavigationBloc>().add(NavigationToggleEvent(index: value));
              },
              items: [
                Icon(Icons.home_outlined, size: DimensionHelper.dimens_50,color: Colors.white,),
                Icon(Icons.shopping_bag_outlined,
                  size: DimensionHelper.dimens_50,color: Colors.white,),
                Icon(Icons.wallet_outlined, size: DimensionHelper.dimens_50,color: Colors.white,),
                Icon(Icons.person_outline_outlined,
                  size: DimensionHelper.dimens_50,color: Colors.white,)
              ]);
        },
      ),
    );
  }
}
