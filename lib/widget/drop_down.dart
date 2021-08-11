


import 'package:b_store/models/city.dart';
import 'package:b_store/utils/AppColors.dart';
import 'package:b_store/utils/size_config.dart';
import 'package:flutter/material.dart';
class DropDownn extends StatelessWidget {
final  Function(City?) onChanged;
final List<City> list;
final City value;

final String hint;
DropDownn({required this.onChanged,required  this.list,required this.value,required  this.hint});

@override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

       width: SizeConfig.scaleWidth(130),
        height: SizeConfig.scaleHeight(45),

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 1,
            color: Color(0xff000000).withOpacity(0.1),
          )
        ),
        child: Center (
         child: DropdownButton<City>(
           value: value,
               dropdownColor: Colors.white,
           elevation: 0,

         iconEnabledColor: AppColors.app_color,
         isExpanded: true,
          hint:  Text(hint),
          underline: Container(color: Colors.transparent),
          onChanged: onChanged,

           items: list.map<DropdownMenuItem<City>>((City city) {
             return DropdownMenuItem<City >(

               child:  Padding(
                 padding:  EdgeInsets.only(left:SizeConfig.scaleWidth(10)),
                 child: Text(city.nameEn,style: TextStyle( color: AppColors.app_text1,
                   fontFamily: 'Poppins',

                   fontSize: SizeConfig.scaleTextFont(12),),),
               ),
               value: city,
             );
           }).toList(),
         ),
        )
      ),
    );
  }
}
