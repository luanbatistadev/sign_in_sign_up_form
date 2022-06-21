import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final bool isPassWord;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  const CustomTextFormField({
    Key? key,
    required this.label,
    this.isPassWord = false,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
    this.validator,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isVisible = true;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isNotMinorHeight = size.height > 720;
    return TextFormField(
      controller: textEditingController,
      textInputAction: widget.textInputAction,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      onChanged: widget.onChanged,
      obscureText: widget.isPassWord && isVisible,
      scrollPadding: EdgeInsets.only(
        bottom: isNotMinorHeight
            ? MediaQuery.of(context).size.height * 0.5
            : MediaQuery.of(context).size.height * 0.25,
      ),
      decoration: InputDecoration(
        errorMaxLines: 3,
        hintText: widget.label,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.tertiary,
          fontSize: isNotMinorHeight ? 18 : 14,
        ),
        suffixIcon: widget.isPassWord
            ? InkWell(
                onTap: () => setState(() {
                  isVisible = !isVisible;
                }),
                child:
                    Icon(isVisible ? Icons.visibility : Icons.visibility_off),
              )
            : null,
        contentPadding: const EdgeInsets.only(top: 20),
      ),
    );
  }
}
