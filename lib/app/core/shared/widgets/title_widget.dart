// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final double fontSize;
  const TitleWidget({
    Key? key,
    required this.title,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bool isNotMinorHeight = size.height > 720;
    return Padding(
      padding: EdgeInsets.only(
        top: isNotMinorHeight ? 30 : 0,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 67, 90, 194),
          fontSize: fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
