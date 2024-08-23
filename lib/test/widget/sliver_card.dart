import 'package:flutter/material.dart';

class SliverCard extends StatelessWidget {
  const SliverCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: 4,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 16, crossAxisCount: 2, crossAxisSpacing: 16),
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
