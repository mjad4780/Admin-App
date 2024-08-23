import 'package:flutter_bloc/flutter_bloc.dart';

import '../Future/mainScreen/logic/main_cubit/main_cubit.dart';
import '../core/constans/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utility/constants.dart';
import '../utility/size_config.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.title,
  });

  final String title;

  // final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            if (MediaQuery.sizeOf(context).width <= SizeConfig.desktop)
              // if (MediaQuery.sizeOf(context).width <= SizeConfig.tablet)
              IconButton(
                  onPressed: () {
                    context
                        .read<MainCubit>()
                        .scaffoldKey
                        .currentState!
                        .openDrawer();
                  },
                  icon: const Icon(Icons.menu)),
            if (MediaQuery.sizeOf(context).width > 400)
              Text(
                title,
                style: Theme.of(context).textTheme.titleLarge,
              ),
          ],
        ),
        const SizedBox(
          width: 11,
        ),
        const Spacer(
          flex: 1,
        ),
        Expanded(
            flex: 2,
            child: SearchField(
              onChange: (val) {
                //TODO: should complete call filterCategories
              },
            )),
        // const ProfileCard()
      ],
    );
  }
}

class SearchField extends StatelessWidget {
  final Function(String) onChange;

  const SearchField({
    super.key,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(defaultPadding * 0.75),
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(Assets.iconsSearch),
          ),
        ),
      ),
      onChanged: (value) {
        onChange(value);
      },
    );
  }
}
