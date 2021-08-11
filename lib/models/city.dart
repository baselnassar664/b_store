import 'package:b_store/models/student.dart';

class City{
 int id;
 String nameEn;
 String nameAr;

 City({required this.id,required  this.nameEn, required this.nameAr});
 static  List<City> city=[
   City(id: 1,nameEn: 'Gaza ',nameAr: 'غزة 	'),
   City(id: 2,nameEn: 'Deir Al-Balah ',nameAr: 'دير البلح'),
   City(id: 3,nameEn: 'Khanyounis  ',nameAr: 'خانيونس'),
   City(id: 4,nameEn: 'Al Nosyrat ',nameAr: 'النصيرات'),
   City(id: 5,nameEn: 'Al Borayj  ',nameAr: 'البريج'),
   City(id: 6,nameEn: 'Al Mghazi ',nameAr: 'المغازي'),
   City(id: 7,nameEn: 'Rafah  ',nameAr: 'رفح'),
   City(id: 8,nameEn: '	Jbalya ',nameAr: 'جباليا'),
   City(id: 9,nameEn: ' Beit Lahya',nameAr: 'بيت لاهيا'),
   City(id: 10,nameEn: '	Biet Hanoon',nameAr: 'بيت حانون'),

 ];
 static List<City> gender=[
   City(id: 1,nameEn: 'Male',nameAr: 'ذكر'),
   City(id: 2,nameEn: 'Female',nameAr: 'انثى'),

 ];
}
/*
1 	Gaza 	غزة
2 	Deir Al-Balah 	دير البلح
3 	Khanyounis 	خانيونس
4 	Al Nosyrat 	النصيرات
5 	Al Borayj 	البريج
6 	Al Mghazi 	المغازي
7 	Rafah 	رفح
8 	Al Zwayda 	الزوايدة
9 	Jbalya 	جباليا
10 	Beit Lahya 	بيت لاهيا
11 	Biet Hanoon


 */