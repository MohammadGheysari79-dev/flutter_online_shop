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
        child: CircleLayeredWidget(
          height: 320.r,
          width: 320.r,
          layersSpace: 22.r,
          color: [
            AppColors.splashBackground.shade400,
            AppColors.splashBackground.shade300,
            AppColors.splashBackground.shade200,
            AppColors.splashBackground.shade100,
          ],
        ),
      ),
    );
  }
}
