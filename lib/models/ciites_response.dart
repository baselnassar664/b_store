import 'cities.dart';

class CitiesResponse{
late  bool status;
late  String message;
late  List<Cities> list;



  CitiesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['list'] != null) {
      list = <Cities>[];
      json['list'].forEach((v) {
        list.add(Cities.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> list = new Map<String, dynamic>();
    list['status'] = this.status;
    list['message'] = this.message;
    list['list'] = this.list.map((v) => v.toJson()).toList();
    return list;
  }
}