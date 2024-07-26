import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/PosterScreen/logic/cubit/cubit/posters_cubit.dart';
import 'package:untitled/Future/Drawer/PosterScreen/logic/cubit/cubit/posters_state.dart';

import '../../../../core/theming/colors.dart';
import 'poster_list_section.dart';

class PostersBlocBuilder extends StatelessWidget {
  const PostersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostersCubit, PostersState>(
      buildWhen: (previous, current) =>
          current is Loadingview ||
          current is Successview ||
          current is Erorrview,
      builder: (context, state) {
        return state.maybeWhen(
          loadingview: () {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColor.mainBlue,
              ),
            );
          },
          successview: (products) {
            return PosterListSection(
              poster: products,
            );
          },
          erorrview: (error) {
            return Text(error);
          },
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
