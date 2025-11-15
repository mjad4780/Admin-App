import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utility/constants.dart';
import '../logic/cubit/dashboard_cubit.dart';
import 'ListCardSummeryInfo.dart';
import 'product_summery_card.dart';

class ProductSummerySection extends StatelessWidget {
  const ProductSummerySection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var dashpord = context.read<DashboardCubit>();

    return BlocProvider.value(
      value: dashpord,
      child: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: listCardSummeryInfo(context).length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.sizeOf(context).width >= 585 ? 4 : 2,
              crossAxisSpacing: defaultPadding,
              mainAxisSpacing: defaultPadding,
              childAspectRatio: size.width < 1400 ? 1.1 : 1.4,
            ),
            itemBuilder: (context, index) => ProductSummeryCard(
              info: listCardSummeryInfo(context)[index],
              onTap: (productType) {
                //TODO: should complete call filterProductsByQuantity
              },
            ),
          ),
        ],
      ),
    );
  }
}
