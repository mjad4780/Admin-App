import 'package:untitled/features/drawer/PosterScreen/logic/cubit/cubit/posters_cubit.dart';
import 'package:untitled/features/drawer/PosterScreen/logic/cubit/cubit/posters_state.dart';

import '../../../../core/function/validator.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../utility/constants.dart';
import '../../../../widgets/RowBottomAdd.dart';
import '../../../../widgets/custom_text_field.dart';
import '../../../../widgets/product_image_card.dart';

class PosterSubmitForm extends StatelessWidget {
  const PosterSubmitForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: context.read<PostersCubit>().formstate,
        child: Container(
          // padding: const EdgeInsets.all(defaultPadding),
          width: MediaQuery.sizeOf(context).width >= 834.0
              ? size.width * 0.3
              : size.width,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(defaultPadding),
              image(),
              const Gap(defaultPadding),
              CustomTextField(
                controller: context.read<PostersCubit>().title,
                labelText: 'Poster Name',
                onSave: (val) {},
                validator: (value) {
                  validator(value, 'Please enter a poster name');
                  return null;
                },
              ),
              CustomTextField(
                controller: context.read<PostersCubit>().body,
                labelText: 'Poster body',
                onSave: (val) {},
                validator: (value) {
                  validator(value, 'Please enter a poster body');
                  return null;
                },
              ),
              const Gap(defaultPadding * 2),
              RowBotttomAdd(
                onPressed: () {
                  context.read<PostersCubit>().addPoster(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  BlocConsumer<PostersCubit, PostersState> image() {
    return BlocConsumer<PostersCubit, PostersState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ProductImageCard(
          size: 150,
          labelText: "Category",
          imageFile: context.read<PostersCubit>().file,
          onTap: () {
            context.read<PostersCubit>().chooseimagegaler();
          },
          imageUrlForUpdateImage:
              '${ApiConstants.imageposter}/${context.read<PostersCubit>().image}',
          ifcondition: 'http://localhost/e-ecommerse/upload/poster/null',
        );
      },
    );
  }
}

// How to show the category popup
// void showAddPosterForm(BuildContext context, Poster? poster) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         backgroundColor: bgColor,
//         title: Center(
//             child: Text('Add Poster'.toUpperCase(),
//                 style: TextStyle(color: primaryColor))),
//         content: PosterSubmitForm(poster: poster),
//       );
//     },
//   );
// }
