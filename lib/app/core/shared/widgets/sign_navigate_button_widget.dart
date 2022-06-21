import 'package:flutter/material.dart';

class SignNavigateButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const SignNavigateButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color colorSchemePrimary = Theme.of(context).colorScheme.primary;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: colorSchemePrimary,
            fontWeight: FontWeight.w400,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
