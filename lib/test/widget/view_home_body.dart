import 'package:flutter/material.dart';

import 'sliver_card.dart';

class ViewHomeBody extends StatelessWidget {
  const ViewHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverCard()
        ],
      ),
    );
  }
}
