
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
class ApparText extends StatelessWidget {
  final String text;

  ApparText({required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: SizeConfig.scaleTextFont(16),
      ),
    );
  }
}
