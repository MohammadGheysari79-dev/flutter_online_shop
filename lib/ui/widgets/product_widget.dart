import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_colors.dart';
import '../../data_layer/model/product.dart';
import '../../utils/string_utils.dart';

class ProductWidget extends StatefulWidget {
  const ProductWidget({required this.product, super.key});

  final Product product;

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 138.w,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _getTopStack()),
            Padding(
              padding: EdgeInsets.only(right: 10, bottom: 5.h),
              child: Text(
                widget.product.name,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.black,
                    ),
              ),
            ),
            _getBottomContainer(),
          ],
        ),
      ),
    );
  }

  Widget _getBottomContainer() {
    return Container(
      height: 53,
      color: AppColors.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            'assets/images/icon_right_arrow_circle.png',
            width: 22,
            height: 22,
          ),
          const SizedBox(width: 6),
          _getPricePart(),
          Text(
            'تومان',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  Widget _getPricePart() {
    bool haveOff = widget.product.off != null;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          StringUtils.priceType('${widget.product.price}'),
          style: (haveOff)
              ? Theme.of(context).textTheme.bodySmall!.copyWith(
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.white,
                  )
              : Theme.of(context).textTheme.bodyMedium,
        ),
        if (haveOff)
          Text(
            StringUtils.priceType('${widget.product.priceByOff()}'),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
      ],
    );
  }

  Widget _getTopStack() {
    return Stack(
      children: [
        _getFavoriteIcon(),
        Center(child: Image.asset('assets/images/product1.png')),
        if (widget.product.off != null) _getOffContainer(),
      ],
    );
  }

  Widget _getFavoriteIcon() {
    return Positioned(
      top: 10,
      right: 10,
      child: GestureDetector(
        onTap: () {
          setState(() {
            widget.product.favorite = !widget.product.favorite;
          });
        },
        child: Image.asset(
          (widget.product.favorite)
              ? 'assets/images/active_icon_favorite.png'
              : 'assets/images/icon_favorite.png',
        ),
      ),
    );
  }

  Widget _getOffContainer() {
    return Positioned(
      bottom: 10,
      left: 10,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 6.r, vertical: 1.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
        ),
        alignment: Alignment.center,
        child: Text(
          '%${widget.product.off}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}
