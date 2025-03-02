import 'package:flutter/material.dart';

import '../../../../core/constant/assetsHelper.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(AssetsHelper.onboard)
        ],
      ),
    );
  }
}
