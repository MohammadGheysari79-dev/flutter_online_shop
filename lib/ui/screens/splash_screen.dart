import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../widgets/circle_layered_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackground.shade600,
      body: Center(
        child: _getLogoPart(),
      ),
    );
  }

  Widget _getLogoPart() {
    return CircleLayeredWidget(
      height: 308.r,
      width: 308.r,
      layersSpace: 21.r,
      color: [
        AppColors.splashBackground.shade400,
        AppColors.splashBackground.shade300,
        AppColors.splashBackground.shade200,
        AppColors.splashBackground.shade100,
      ],
      child: Column(
        children: [
          Image.asset(
            'assets/images/splash_logo.png',
            width: 80.r,
            height: 80.r,
          ),
          SizedBox(height: 10.h),
          const Text(
            'اپل شاپ',
            style: TextStyle(
              color: Colors.white,
              // todo : continue from there
            ),
          ),
        ],
      ),
    );
  }
}
