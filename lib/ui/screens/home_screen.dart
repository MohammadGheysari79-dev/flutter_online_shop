import 'package:flutter/material.dart';
import 'package:flutter_online_shop/constants/app_colors.dart';
import 'package:flutter_online_shop/ui/widgets/category_widget.dart';
import 'package:flutter_online_shop/ui/widgets/squircle_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Color> colors = [
    Colors.red,
    AppColors.primry,
    Colors.green,
    Colors.indigo,
    Colors.pinkAccent,
    Colors.amber,
  ];
  final _pageViewController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 12.w, bottom: 14.h),
              child: const Text('دسته بندی'),
            ),
            _getCategoryList(),
          ],
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 90.r,
      child: ListView.builder(
        itemCount: 22,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        itemBuilder: (_, index) {
          return Padding(
            padding: EdgeInsets.only(left: 12.w),
            child: CategoryWidget(
              title: 'همه',
              space: 8.r,
              child: SquircleWidget(
                width: 55.r,
                height: 55.r,
                radius: 38.r,
                color: colors[index % 6],
                shadows: [
                  BoxShadow(
                    color: colors[index % 6],
                    offset: const Offset(0, 10),
                    blurRadius: 20,
                    spreadRadius: -10,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _getSearchBar() {
    return const TextField(
      decoration: InputDecoration(
        icon: ImageIcon(
          AssetImage('assets/images/icon_search.png'),
        ),
        suffixIcon: ImageIcon(
          AssetImage('assets/images/icon_apple_blue.png'),
        ),
      ),
    );
  }

  Widget _getBannerPart() {
    return SizedBox(
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
    );
  }

  Widget _getPageView() {
    return PageView.builder(
      itemCount: 3,
      controller: _pageViewController,
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
              style: const TextStyle(
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
      controller: _pageViewController,
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
