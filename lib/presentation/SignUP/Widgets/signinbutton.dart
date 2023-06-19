import 'package:flutter/material.dart';

class SignInRegisterButton extends StatelessWidget {
  final String buttonText;
  final Function callback;
  const SignInRegisterButton(
      {super.key, required this.buttonText, required this.callback});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: () => callback(),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: themeData.colorScheme.secondary,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(buttonText,
              style: themeData.textTheme.headline4?.copyWith(
                  color: themeData.colorScheme.onPrimary,
                  fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }
}
