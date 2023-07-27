// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Function callback;
  final double br;
  const CustomButton(
      {Key? key,
      required this.buttonText,
      required this.callback,
      required this.br})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
            color: themeData.colorScheme.primary,
            borderRadius: BorderRadius.circular(br)),
        child: Center(
          child: Text(
            buttonText,
            style: themeData.textTheme.headline1!
                .copyWith(fontSize: 14, letterSpacing: 4),
          ),
        ),
      ),
    );
  }
}
