import '../../../../core/get_it/get_it.dart';
import '../widget/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/main_cubit/main_cubit.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MainCubit>(),
      child: BlocConsumer<MainCubit, MainState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SideMenu(),
                  ),
                  Expanded(
                    flex: 5,
                    child: context.read<MainCubit>().selectedScreen,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
