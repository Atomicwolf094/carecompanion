import 'package:flutter/material.dart';
import '../../constants/assets.dart';
import '../constants/colors.dart';
import '../routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then(
      (_) {
        Navigator.pushReplacementNamed(context, Routes.landingPageScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.themeColor,
      child: Center(
        child: Image.asset(Assets.appLogo),
      ),
    );
  }
}
