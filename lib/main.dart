import "package:flutter/material.dart";
import "package:flutter_online_shop/constants/app_colors.dart";
import "package:flutter_online_shop/ui/screens/home_screen.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";

import "ui/screens/splash_screen.dart";

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    // default design size is Size(360,690)
    return ScreenUtilInit(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Shabnam',
          textTheme: const TextTheme(
            titleSmall: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: AppColors.textTitle1,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Colors.black,
            ),
            bodyLarge: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.black,
            ),
            bodyMedium: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
              color: Colors.white,
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 10,
              color: Colors.white,
            ),
          ),
        ),
        initialRoute: '/home',
        // todo : replace with '/' to start from splash screen
        routes: {
          '/': (_) => const SplashScreen(),
          '/home': (_) => const Directionality(
                textDirection: TextDirection.rtl,
                child: HomeScreen(),
              ),
        },
      ),
    );
  }
}
