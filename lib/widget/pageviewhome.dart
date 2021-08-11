import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';


class PageViewHome extends StatelessWidget {
  final String image;

  PageViewHome({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.scaleHeight(147),
      child: (Image.asset(
        
        image,
        fit: BoxFit.cover,
        height: double.infinity,
      )),
    );
  }
}
