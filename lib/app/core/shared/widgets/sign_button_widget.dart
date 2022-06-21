import 'package:flutter/material.dart';

class SignButtonWidget extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Widget icon;
  const SignButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color colorSchemePrimary = Theme.of(context).colorScheme.primary;

    final size = MediaQuery.of(context).size;
    final bool isMinorHeight = size.height > 720;

    return Padding(
      padding: EdgeInsets.only(top: isMinorHeight ? 35 : 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: colorSchemePrimary,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          CircleAvatar(
            radius: isMinorHeight ? 30 : 25,
            backgroundColor: colorSchemePrimary,
            child: IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
          ),
        ],
      ),
    );
  }
}
