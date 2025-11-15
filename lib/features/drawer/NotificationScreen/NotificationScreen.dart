import '../../../core/get_it/get_it.dart';
import '../../../widgets/Heder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../utility/constants.dart';
import 'logic/cubit/notification_cubit.dart';
import 'widget/notification_bloc_builder.dart';
import 'widget/send_notification_form.dart';
import 'widget/show_add_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => getIt<NotificationCubit>()..viewNotification(),
      child: SingleChildScrollView(
        primary: false,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(title: 'Notification'),
            const Gap(defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              "My Notification",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Builder(builder: (context) {
                            return ElevatedButton.icon(
                              style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding,
                                ),
                              ),
                              onPressed: () {
                                showSendNotification(
                                    context,
                                    'Send Notification',
                                    const SendNotificationForm());
                                // const SendNotificationBloc();
                              },
                              icon: const Icon(Icons.add),
                              label: const Text("Send New"),
                            );
                          }),
                          const Gap(20),
                          Builder(builder: (context) {
                            return IconButton(
                                onPressed: () {
                                  context
                                      .read<NotificationCubit>()
                                      .viewNotification();
                                },
                                icon: const Icon(Icons.refresh));
                          }),
                        ],
                      ),
                      const Gap(defaultPadding),
                      const NotificationBlocBuilder(),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
