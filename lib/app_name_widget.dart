import 'package:flutter/material.dart';
import 'package:foodly_ui/const/app_colors.dart';
import 'package:foodly_ui/text/text_builder.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextBuilder(
            text: 'Diner ',
            color: AppColors.kBlue,
            fontSize: 30,
            fontWeight: FontWeight.w700),
        // TextBuilder(text: 'STORE', color: AppColors.kGreen, fontSize: 30),
      ],
    );
  }
}
