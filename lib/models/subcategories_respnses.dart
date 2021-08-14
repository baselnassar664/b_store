import 'package:b_store/models/sub_categories.dart';

class SubCategoriesResponse{
  late  bool status;
  late  String message;
  late  List<SubCategories> list;

  SubCategoriesResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['list'] != null) {
      list = <SubCategories>[];
      json['list'].forEach((v) {
        list.add(SubCategories.fromJson(v));
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