import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/DashboardScreen/logic/cubit/dashboard_state.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../widgets/product_image_card.dart';
import '../logic/cubit/dashboard_cubit.dart';

class RowAddImages extends StatelessWidget {
  const RowAddImages({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardCubit, DashboardState>(
      builder: (context, state) {
        return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ProductImageCard(
                labelText: 'Main Image',
                imageFile: context.read<DashboardCubit>().selectedMainImage,
                imageUrlForUpdateImage: '${ApiConstants.imageItem}/null',
                //  '${ApiConstants.imageItem}/${context.read<DashboardCubit>().image}',
                ifcondition: 'http://localhost/e-ecommerse/upload/item/null',
                onTap: () {
                  context.read<DashboardCubit>().pickImage(imageCardNumber: 1);
                },
                onRemoveImage: () {
                  context.read<DashboardCubit>().hhhhhhh(1);
                },
              ),
              ProductImageCard(
                labelText: 'Second image',
                imageFile: context.read<DashboardCubit>().selectedSecondImage,
                imageUrlForUpdateImage: '${ApiConstants.imageItem}/null',
                ifcondition: 'http://localhost/e-ecommerse/upload/item/null',
                onTap: () {
                  context.read<DashboardCubit>().pickImage(imageCardNumber: 2);
                },
                onRemoveImage: () {
                  context.read<DashboardCubit>().hhhhhhh(2);
                },
              ),
              ProductImageCard(
                labelText: 'Third image',
                imageFile: context.read<DashboardCubit>().selectedThirdImage,
                imageUrlForUpdateImage: '${ApiConstants.imageItem}/null',
                ifcondition: 'http://localhost/e-ecommerse/upload/item/null',
                onTap: () {
                  context.read<DashboardCubit>().pickImage(imageCardNumber: 3);
                },
                onRemoveImage: () {
                  context.read<DashboardCubit>().hhhhhhh(3);
                },
              ),
            ]);
      },
      listener: (BuildContext context, DashboardState state) {},
    );
  }
}
