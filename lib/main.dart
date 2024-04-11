import "package:flutter/material.dart";
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
