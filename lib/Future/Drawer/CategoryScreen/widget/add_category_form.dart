import '../../../../core/get_it/get_it.dart';
import '../logic/CategoryScreen_cubit/category_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/function/validator.dart';
import '../../../../utility/constants.dart';
import '../../../../widgets/RowBottomAdd.dart';
import '../../../../widgets/category_image_card.dart';
import '../../../../widgets/custom_text_field.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class CategorySubmitForm extends StatelessWidget {
  // final CategoryModel? category;

  const CategorySubmitForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //TODO: should complete call setDataForUpdateCategory
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>(),
      child: BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: context.read<CategoryCubit>().addCategoryFormKey,
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                width: size.width * 0.3,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(defaultPadding),
                    CategoryImageCard(
                      labelText: "Category",
                      imageFile:
                          context.read<CategoryCubit>().selectedImage ?? null,
                      onTap: () {
                        context.read<CategoryCubit>().pickImage();
                      },
                      imageUrlForUpdateImage: context
                              .read<CategoryCubit>()
                              .categoryForUpdate
                              ?.image ??
                          null,
                    ),
                    Gap(defaultPadding),
                    CustomTextField(
                      controller:
                          context.read<CategoryCubit>().categoryNameCtrl,
                      labelText: 'Category Name',
                      onSave: (val) {},
                      validator: (value) {
                        return validator(value, 'Please enter a category name');
                      },
                    ),
                    Gap(defaultPadding * 2),
                    RowBotttomAdd(
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
