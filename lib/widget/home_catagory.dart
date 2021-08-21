
import 'package:b_store/models/Categories.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';

class HomeCategoryWidget extends StatelessWidget {
  final Categories category;
  final void Function() onTap;

  HomeCategoryWidget({required this.category, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 165,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: CachedNetworkImage(
                  height: 172,
                  width: double.infinity,
                  imageUrl: category.imageUrl,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: AppColors.app_color,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              AppText(
                text: category.nameEn,
                fontsize: SizeConfig.scaleTextFont(15),
                color: AppColors.app_text1,
                fontWeight: FontWeight.w600,
              ),

            ],
          ),
        ),
      ),
    );
  }
}