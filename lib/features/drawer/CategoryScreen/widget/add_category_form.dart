import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/features/drawer/CategoryScreen/logic/cubit/categories_state.dart';

import '../../../../core/function/validator.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../utility/constants.dart';
import '../../../../widgets/RowBottomAdd.dart';
import '../../../../widgets/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../widgets/product_image_card.dart';
// import '../logic/cubit/categories_cubit.dart';
import 'package:untitled/features/drawer/CategoryScreen/logic/cubit/categories_cubit.dart';

class CategorySubmitForm extends StatelessWidget {
  final void Function() onPressed;
  const CategorySubmitForm({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: context.read<CategoriesCubit>().addCategoryFormKey,
        child: Container(
          // padding: const EdgeInsets.all(defaultPadding),
          width: MediaQuery.sizeOf(context).width >= 834.0
              ? size.width * 0.3
              : size.width,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(defaultPadding),
              image(),
              const Gap(defaultPadding),
              CustomTextField(
                controller: context.read<CategoriesCubit>().name,
                labelText: 'Category Name',
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter a category name');
                },
              ),
              CustomTextField(
                controller: context.read<CategoriesCubit>().namear,
                labelText: 'Category Name Ar',
                onSave: (val) {},
                validator: (value) {
                  return validator(value, 'Please enter a category namear');
                },
              ),
              const Gap(defaultPadding * 2),
              RowBotttomAdd(
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<CategoriesCubit, CategoriesState> image() {
    return BlocConsumer<CategoriesCubit, CategoriesState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ProductImageCard(
          size: 150,
          labelText: "Category",
          imageFile: context.read<CategoriesCubit>().file,
          onTap: () {
            context.read<CategoriesCubit>().chooseimagegaler();
          },
          imageUrlForUpdateImage:
              '${ApiConstants.imageCat}/${context.read<CategoriesCubit>().image}',
          ifcondition: 'http://localhost/e-ecommerse/upload/categories/null',
        );
      },
    );
  }
}
