import 'Categories.dart';

class CategoriesResponse{
late  bool status;
late  String message;
late  List<Categories> list;

CategoriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['list'] != null) {
      list = <Categories>[];
      json['list'].forEach((v) {
        list.add(Categories.fromJson(v));
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