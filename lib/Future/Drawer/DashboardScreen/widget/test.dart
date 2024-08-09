import 'package:flutter/material.dart';

import '../../../../core/function/function_api/ssend_list_api.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../models/response_items/datum.dart';

class Tester extends StatelessWidget {
  const Tester({super.key, required this.products});

  final List<ItemsData> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.black,
      height: 500,
      width: 400,
      child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return name(
              data: replacListIsEnpty(products[5].images!),
            );
            // return Image.network(
            //   '${ApiConstants.imageItem}/${rtert(products[5].images!)[index]} ',
            //   // color: Colors.red
            // );
          }),
    );
  }
}

class name extends StatelessWidget {
  const name({super.key, required this.data});
  final List<String> data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            '${ApiConstants.imageItem}/${data[index]} ',
            // color: Colors.red
          );
        },
      ),
    );
  }
}
