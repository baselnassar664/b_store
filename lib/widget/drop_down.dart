import 'package:b_store/models/city.dart';
import 'package:flutter/material.dart';
class DropDownn extends StatelessWidget {
final  Function(int?) onChanged;


DropDownn({required this.onChanged});
List<City> _city=[
  City(id: 1,nameEn: 'Gaza ',nameAr: 'غزة 	'),
  City(id: 2,nameEn: 'Deir Al-Balah ',nameAr: 'دير البلح'),
  City(id: 3,nameEn: 'Khanyounis  ',nameAr: 'خانيونس'),
  City(id: 4,nameEn: 'Al Nosyrat ',nameAr: 'النصيرات'),
  City(id: 5,nameEn: 'Al Borayj  ',nameAr: 'البريج'),
  City(id: 6,nameEn: 'Al Mghazi ',nameAr: 'المغازي'),
  City(id: 7,nameEn: 'Rafah  ',nameAr: 'رفح'),
  City(id: 8,nameEn: '	Jbalya ',nameAr: 'جباليا'),
  City(id: 9,nameEn: ' Beit Lahya',nameAr: 'بيت لاهيا'),
  City(id: 10,nameEn: '	Biet Hanoon',nameAr: 'غزة 	'),
  City(id: 11,nameEn: 'Gaza ',nameAr: 'بيت حانون'),
];
@override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton<int>(
      items:  _city.map((City city) {
        return new DropdownMenuItem<int>(
          value: city.id,
          child: Row(
            children: [
              Text(city.nameEn),
              Text(city.nameAr)
            ],
          )
        );
      }).toList(),
          onChanged: onChanged,
      )
    );
  }
}
