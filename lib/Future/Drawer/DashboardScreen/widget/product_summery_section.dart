import 'package:flutter/material.dart';

import '../../../../utility/constants.dart';
import 'ListCardSummeryInfo.dart';
import 'product_summery_card.dart';

class ProductSummerySection extends StatelessWidget {
  ProductSummerySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;

    return Column(
      children: [
        GridView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: ListCardSummeryInfo(context).length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: defaultPadding,
            mainAxisSpacing: defaultPadding,
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
          itemBuilder: (context, index) => ProductSummeryCard(
            info: ListCardSummeryInfo(context)[index],
            onTap: (productType) {
              //TODO: should complete call filterProductsByQuantity
            },
          ),
        ),
      ],
    );
  }
}
