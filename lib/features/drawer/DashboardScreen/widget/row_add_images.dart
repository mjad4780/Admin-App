import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/drawer/DashboardScreen/logic/cubit/dashboard_cubit.dart';
import 'package:untitled/features/drawer/DashboardScreen/logic/cubit/dashboard_state.dart';

import '../../../../core/networking/api_constants.dart';
import '../../../../widgets/product_image_card.dart';

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
                imageUrlForUpdateImage:
                    '${ApiConstants.imageItem}/${context.read<DashboardCubit>().oldemainimage}',
                //  '${ApiConstants.imageItem}/${context.read<DashboardCubit>().image}',
                ifcondition: 'http://localhost/e-ecommerse/upload/item/null',
                onTap: () {
                  context.read<DashboardCubit>().pickImage(imageCardNumber: 1);
                },
                onRemoveImage: () {
                  context.read<DashboardCubit>().removeImages(1);
                },
              ),
              ProductImageCard(
                labelText: 'Second image',
                imageFile: context.read<DashboardCubit>().selectedSecondImage,
                imageUrlForUpdateImage:
                    '${ApiConstants.imageItem}/${context.read<DashboardCubit>().oldimages[0]}',
                ifcondition: 'http://localhost/e-ecommerse/upload/item/l',
                onTap: () {
                  context.read<DashboardCubit>().pickImage(imageCardNumber: 2);
                },
                onRemoveImage: () {
                  context.read<DashboardCubit>().removeImages(2);
                },
              ),
              ProductImageCard(
                labelText: 'Third image',
                imageFile: context.read<DashboardCubit>().selectedThirdImage,
                imageUrlForUpdateImage:
                    '${ApiConstants.imageItem}/${context.read<DashboardCubit>().oldimages[1]}',
                ifcondition: 'http://localhost/e-ecommerse/upload/item/m',
                onTap: () {
                  context.read<DashboardCubit>().pickImage(imageCardNumber: 3);
                },
                onRemoveImage: () {
                  context.read<DashboardCubit>().removeImages(3);
                },
              ),
            ]);
      },
      listener: (BuildContext context, DashboardState state) {},
    );
  }
}
