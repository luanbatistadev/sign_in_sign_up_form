import 'package:flutter/material.dart';

class RememberMeAndForgotPassword extends StatefulWidget {
  const RememberMeAndForgotPassword({
    Key? key,
  }) : super(key: key);

  @override
  State<RememberMeAndForgotPassword> createState() =>
      _RememberMeAndForgotPasswordState();
}

class _RememberMeAndForgotPasswordState
    extends State<RememberMeAndForgotPassword> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).colorScheme.primary;
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 15,
                width: 15,
                child: Checkbox(
                  value: isTapped,
                  onChanged: (v) => setState(() {
                    isTapped = v!;
                  }),
                  activeColor: color,
                  side: BorderSide(
                    color: color,
                    width: 2,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                'Remember me',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Forgot password?',
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
