import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/Future/Drawer/PosterScreen/logic/cubit/cubit/posters_cubit.dart';

import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'widget/add_poster_bloc.dart';
import 'widget/add_poster_form.dart';
import 'widget/show_and_form_dialog.dart';
import 'widget/view_poster_bloc.dart';

class PosterScreen extends StatelessWidget {
  const PosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      primary: false,
      padding: const EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          const Header(
            title: 'Posters',
          ),
          const SizedBox(height: defaultPadding),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            "My Posters",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        ElevatedButton.icon(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding * 1.5,
                              vertical: defaultPadding,
                            ),
                          ),
                          onPressed: () {
                            context.read<PostersCubit>().title.clear();
                            context.read<PostersCubit>().body.clear();
                            showAddForm(
                              context,
                              'Add Poster',
                              const PosterSubmitForm(),
                            );
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add New"),
                        ),
                        const Gap(20),
                        IconButton(
                            onPressed: () {
                              context.read<PostersCubit>().viewPoster();
                            },
                            icon: const Icon(Icons.refresh)),
                      ],
                    ),
                    const Gap(defaultPadding),
                    const PostersBlocBuilder(),
                    const AddPostersBlocListener()
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
