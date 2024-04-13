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
      backgroundColor: AppColors.primary.shade600,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.w,
          ).copyWith(
            top: 50.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(width: double.infinity),
              _getLogoPart(),
              SizedBox(height: 90.h),
              _getLabelPart(),
              SizedBox(height: 15.h),
              _getSkipPart(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getLogoPart() {
    return CircleLayeredWidget(
      height: 308.r,
      width: 308.r,
      layersSpace: 21.r,
      color: [
        AppColors.primary.shade500,
        AppColors.primary.shade400,
        AppColors.primary.shade300,
        AppColors.primary.shade200,
      ],
      child: Column(
        children: [
          Image.asset(
            'assets/images/splash_logo.png',
            width: 85.r,
            height: 85.r,
          ),
          SizedBox(height: 10.h),
          const Text(
            'اپل شاپ',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getLabelPart() {
    return const Text(
      'اوج هیجان\nبا خرید محصولات\n!اپل',
      textAlign: TextAlign.right,
      style: TextStyle(
        fontSize: 26,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getSkipPart() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: Container(
          color: AppColors.primary.shade800,
          width: 55.r,
          height: 55.r,
          child: Image.asset(
            'assets/images/icon_right_arrow_circle.png',
          ),
        ),
      ),
    );
  }
}
