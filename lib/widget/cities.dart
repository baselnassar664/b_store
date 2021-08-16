import 'package:b_store/models/cities.dart';
import 'package:b_store/preferences/student_preferences.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';

import 'app_text.dart';



class CityWidget extends StatelessWidget {
  final Cities city;
  final void Function() onTap;

  CityWidget({required this.city, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10)),
              child: AppText(
                text: StudentPreferences().languageCode == 'eb' ? city.nameEn[0]: city.nameAr[0],
                color: Colors.white,
                fontsize: SizeConfig.scaleTextFont(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 15),
            Text(StudentPreferences().languageCode == 'en' ? city.nameEn: city.nameAr),
          ],
        ),
      ),
    );
  }
}