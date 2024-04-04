import "package:flutter/material.dart";
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
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashScreen(),
        },
      ),
    );
  }
}
