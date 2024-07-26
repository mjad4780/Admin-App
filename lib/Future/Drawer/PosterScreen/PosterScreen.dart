import '../../../core/get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utility/constants.dart';
import '../../../widgets/Heder.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'widget/add_poster_form.dart';
import 'widget/poster_list_section.dart';

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
                            // showAddForm(
                            //   context,
                            //   'Add Poster',
                            //   PosterSubmitForm(),
                            // );

                            // showAddPosterForm(context, null);
                          },
                          icon: const Icon(Icons.add),
                          label: const Text("Add New"),
                        ),
                        const Gap(20),
                        IconButton(
                            onPressed: () {
                              //TODO: should complete call getAllPosters
                            },
                            icon: const Icon(Icons.refresh)),
                      ],
                    ),
                    const Gap(defaultPadding),
                    const PosterListSection(),
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
