import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/app_colors.dart';
import '../../data_layer/model/product.dart';
import '../widgets/category_widget.dart';
import '../widgets/product_widget.dart';
import '../widgets/squircle_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageViewController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //todo : uncomment this part at the end
              // Padding(
              //   padding: EdgeInsets.only(right: 12.w, bottom: 14.h),
              //   child: const Text('دسته بندی'),
              // ),
              // _getCategoryList(),
              // todo : End part
              ProductWidget(
                product: Product(
                  name: 'گوشی موبایل',
                  price: 10000000,
                  imageAddress: 'assets/images/product1.png',
                  off: 10,
                ),
              ),
            ],
          ),
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
                color: Colors.red,
                //todo : get color from model
                shadows: const [
                  BoxShadow(
                    color: Colors.red,
                    offset: Offset(0, 10),
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
        activeDotColor: AppColors.primary.shade800,
        dotColor: Colors.white,
        expansionFactor: 4,
      ),
    );
  }
}
