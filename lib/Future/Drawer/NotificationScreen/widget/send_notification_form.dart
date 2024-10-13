import 'package:untitled/Future/Drawer/NotificationScreen/logic/cubit/notification_state.dart';

import '../../../../core/function/validator.dart';
import '../../../../widgets/RowBottomAdd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../utility/constants.dart';
import '../../../../widgets/custom_text_field.dart';
import '../logic/cubit/notification_cubit.dart';
import 'send_notification_bloc.dart';

class SendNotificationForm extends StatelessWidget {
  const SendNotificationForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: context.read<NotificationCubit>().sendNotificationFormKey,
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          width: MediaQuery.sizeOf(context).width >= 500
              ? size.width * 0.5
              : size.width,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(defaultPadding),
              CustomTextField(
                  controller: context.read<NotificationCubit>().titleCtrl,
                  labelText: 'Enter Notification Title ....',
                  onSave: (val) {},
                  validator: (value) {
                    validator(value, 'Please enter a Title name');
                    return null;
                  }),
              CustomTextField(
                  controller: context.read<NotificationCubit>().descriptionCtrl,
                  labelText: 'Enter Notification Description ....',
                  lineNumber: 3,
                  onSave: (val) {},
                  validator: (value) {
                    validator(value, 'Please enter a description');
                    return null;
                  }),
              CustomTextField(
                controller: context.read<NotificationCubit>().imageUrlCtrl,
                labelText: 'Enter Notification Image Url ....',
                onSave: (val) {
                  validator(val, 'Please enter a Image Url ');
                },
              ),
              const Gap(defaultPadding * 2),
              BlocConsumer<NotificationCubit, NotificationState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return RowBotttomAdd(
                    loading: state is LoadingAdd ? true : false,
                    onPressed: () {
                      context.read<NotificationCubit>().addNotification();
                    },
                  );
                },
              ),
              const SendNotificationBloc()
            ],
          ),
        ),
      ),
    );
  }
}
