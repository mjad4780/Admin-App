import 'package:flutter/material.dart';

import '../../../../core/function/function_api/ssend_list_api.dart';
import '../../../../models/response_items/datum.dart';
import '../../../../models/response_items/size.dart';

class Tester2 extends StatelessWidget {
  const Tester2({super.key, required this.products});

  final List<ItemsData> products;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // color: Colors.black,
      height: 500,
      width: 400,
      child: ListView.builder(
          itemCount: products[5].size!.length,
          itemBuilder: (context, index) {
            List<ItemSize> i = replacMapsIsEnpty(products[5].size!);
            List<ItemSize> i2 = replacMaps2IsEnpty(products[5].size!);

            print('jjjjjjjjjjjjjjj${i.length}');

            return Column(
              children: [
                // Text(products[5].size!.length.toString()),
                Text(i[0].size.toString()),
                Text(i2[0].color.toString()),

                // name(
                //   size: fff(products[5].size!),
                // ),
              ],
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
  const name({super.key, required this.size});
  final List<ItemSize> size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 400,
      child: ListView.builder(
        itemCount: size.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            size[index].color!,
            style: const TextStyle(color: Colors.amber),
          );
        },
      ),
    );
  }
}
