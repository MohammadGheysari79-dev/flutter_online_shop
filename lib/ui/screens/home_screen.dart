import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_online_shop/constants/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: 150.h,
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              _getPageView(),
              Positioned(
                bottom: 6.h,
                child: _getIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPageView() {
    return PageView.builder(
      itemCount: 3,
      controller: _controller,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 8.w,
        ).copyWith(
          top: 10.h,
        ),
        child: Container(
          color: Colors.red,
          child: Center(
            child: Text(
              '$index',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _getIndicator() {
    return SmoothPageIndicator(
      controller: _controller,
      count: 3,
      effect: ExpandingDotsEffect(
        dotHeight: 9.r,
        dotWidth: 9.r,
        activeDotColor: AppColors.primry.shade800,
        dotColor: Colors.white,
        expansionFactor: 4,
      ),
    );
  }
}
