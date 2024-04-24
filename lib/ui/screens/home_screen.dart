import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../constants/app_colors.dart';
import '../../data_layer/model/category.dart';
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getBannerPart(),
              Padding(
                padding: EdgeInsets.only(
                  top: 32.h,
                  right: 12.w,
                  bottom: 11.h,
                ),
                child: _getTitle('دسته بندی'),
              ),
              _getCategoryList(),
              SizedBox(height: 20.h),
              _getProductTitle('پر فروش ترین ها'),
              _getProductList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getCategoryList() {
    List<Category> testData = [
      Category(
        name: 'همه',
        color: Colors.cyan,
        imageAddress: 'imageAddress',
      ),
      Category(
        name: 'آیفون',
        color: Colors.amber,
        imageAddress: 'imageAddress',
      ),
      Category(
        name: 'مک بوک',
        color: Colors.blueGrey,
        imageAddress: 'imageAddress',
      ),
      Category(
        name: 'اپل واچ',
        color: Colors.green,
        imageAddress: 'imageAddress',
      ),
      Category(
        name: 'آی مک',
        color: Colors.redAccent,
        imageAddress: 'imageAddress',
      ),
      Category(
        name: 'همه',
        color: Colors.purpleAccent,
        imageAddress: 'imageAddress',
      ),
      Category(
        name: 'جدید',
        color: Colors.black12,
        imageAddress: 'imageAddress',
      ),
      Category(
        name: 'تست',
        color: Colors.yellow,
        imageAddress: 'imageAddress',
      ),
    ];
    return SizedBox(
      height: 90.r,
      child: ListView.builder(
        itemCount: testData.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        itemBuilder: (_, index) {
          Category model = testData[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: CategoryWidget(
              title: model.name,
              space: 8.r,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                    fontSize: 12,
                  ),
              child: SquircleWidget(
                width: 55.r,
                height: 55.r,
                radius: 38.r,
                color: model.color,
                shadows: [
                  BoxShadow(
                    color: model.color,
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

  Widget _getProductList() {
    List<Product> testData = [
      Product(
        name: 'آیفون 13 پرومکس',
        price: 100000000,
        imageAddress: 'imageAddress',
      ),
      Product(
        name: 'آیفون 13 پرومکس',
        price: 10000000,
        off: 10,
        imageAddress: 'imageAddress',
      ),
      Product(
        name: 'آیفون 13 پرومکس',
        price: 100000000,
        off: 12,
        imageAddress: 'imageAddress',
      ),
    ];
    return SizedBox(
      height: 200.r,
      child: ListView.builder(
        itemCount: testData.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 6.w),
        itemBuilder: (_, index) {
          Product model = testData[index];
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: ProductWidget(
              product: model,
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

  Widget _getProductTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        children: [
          _getTitle(title),
          const Spacer(),
          GestureDetector(
            onTap: () {
              //todo : show all
            },
            child: Row(
              children: [
                Text(
                  'مشاهده همه',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: AppColors.primary.shade700,
                      ),
                ),
                SizedBox(width: 4.w),
                Icon(
                  Icons.skip_previous,
                  color: AppColors.primary.shade700,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _getTitle(String title) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall,
    );
  }
}
