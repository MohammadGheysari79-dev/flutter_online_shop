import 'package:flutter/material.dart';

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
        height: 216,
        width: 160,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _getTopStack()),
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(widget.product.name),
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
          SizedBox(width: 6),
          _getPricePart(),
          const Text('تومان'),
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
          style: TextStyle(
            decoration: (haveOff) ? TextDecoration.lineThrough : null,
          ),
        ),
        if (haveOff)
          Text(
            StringUtils.priceType('${widget.product.priceByOff()}'),
          ),
      ],
    );
  }

  Widget _getTopStack() {
    return Stack(
      children: [
        _getFavoriteIcon(),
        Center(child: Image.asset('assets/images/product1.png')),
        _getOffContainer(),
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
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
        ),
        alignment: Alignment.center,
        width: 30,
        height: 20,
        child: Text('%${widget.product.off}'),
      ),
    );
  }
}
