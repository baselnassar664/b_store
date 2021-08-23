

class AddressDetails {
  late int id;
  late String name;
  late String info;
  late String contactNumber;
  late int cityId;
  double? lat;
  double? lang;
  City? city;

  AddressDetails();

  AddressDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    info = json['info'];
    contactNumber = json['contact_number'];
    lat = json['lat'];
    lang = json['lang'];
    cityId = json['city_id'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
  }
}
class City {
 late  int id;
 late String nameEn;
 late String nameAr;
 City();


  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_en'] = this.nameEn;
    data['name_ar'] = this.nameAr;
    return data;
  }
}