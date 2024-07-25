import '../../../../core/get_it/get_it.dart';
import '../logic/cubit/notification_cubit.dart';
import '../../../../core/function/validator.dart';
import '../../../../widgets/RowBottomAdd.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../utility/constants.dart';
import '../../../../widgets/custom_text_field.dart';

class SendNotificationForm extends StatelessWidget {
  const SendNotificationForm({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => getIt<NotificationCubit>(),
      child: BlocConsumer<NotificationCubit, NotificationState>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = BlocProvider.of<NotificationCubit>(context);

          return SingleChildScrollView(
            child: Form(
              key: cubit.sendNotificationFormKey,
              child: Container(
                padding: EdgeInsets.all(defaultPadding),
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Gap(defaultPadding),
                    CustomTextField(
                        controller: cubit.titleCtrl,
                        labelText: 'Enter Notification Title ....',
                        onSave: (val) {},
                        validator: (value) {
                          validator(value, 'Please enter a Title name');
                          return null;
                        }),
                    CustomTextField(
                        controller: cubit.descriptionCtrl,
                        labelText: 'Enter Notification Description ....',
                        lineNumber: 3,
                        onSave: (val) {},
                        validator: (value) {
                          validator(value, 'Please enter a description');
                          return null;
                        }),
                    CustomTextField(
                      controller: cubit.imageUrlCtrl,
                      labelText: 'Enter Notification Image Url ....',
                      onSave: (val) {
                        validator(val, 'Please enter a Image Url ');
                      },
                    ),
                    Gap(defaultPadding * 2),
                    RowBotttomAdd(
                      onPressed: () {},
                    )
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

void showAddFormnoti(
  BuildContext context,
  String? text,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          backgroundColor: bgColor,
          title: Center(
              child: Text(text!.toUpperCase(),
                  style: TextStyle(color: primaryColor))),
          content: SendNotificationForm());
    },
  );
}
