class HomeModel {
  late bool status;
  late String message;
  late Data data;

  HomeModel();

  HomeModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }


}

class Data {
  late List<Slider> slider;
  late List<Categories> categories;
  late List<Latest_products> latestProducts;
  late List<Famous_products> famousProducts;

  Data();

  Data.fromJson(dynamic json) {
    if (json['slider'] != null) {
      slider = [];
      json['slider'].forEach((v) {
        slider.add(Slider.fromJson(v));
      });
    }
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories.add(Categories.fromJson(v));
      });
    }
    if (json['latest_products'] != null) {
      latestProducts = [];
      json['latest_products'].forEach((v) {
        latestProducts.add(Latest_products.fromJson(v));
      });
    }
    if (json['famous_products'] != null) {
      famousProducts = [];
      json['famous_products'].forEach((v) {
        famousProducts.add(Famous_products.fromJson(v));
      });
    }
  }


}

class Famous_products {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late num? price;
  late int quantity;
  late num? overalRate;
  late int subCategoryId;
  late num? productRate;
  late dynamic offerPrice;
  late bool isFavorite;
  late String imageUrl;

  Famous_products();

  Famous_products.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
  }


}

class Latest_products {
  late int id;
  late String nameEn;
  late String nameAr;
  late String infoEn;
  late String infoAr;
  late num? price;
  late int quantity;
  late num? overalRate;
  late int subCategoryId;
  late num? productRate;
  late dynamic offerPrice;
  late bool isFavorite;
  late String imageUrl;

  Latest_products();

  Latest_products.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    infoEn = json['info_en'];
    infoAr = json['info_ar'];
    price = json['price'];
    quantity = json['quantity'];
    overalRate = json['overal_rate'];
    subCategoryId = json['sub_category_id'];
    productRate = json['product_rate'];
    offerPrice = json['offer_price'];
    isFavorite = json['is_favorite'];
    imageUrl = json['image_url'];
  }

}

class Categories {
  late int id;
  late String nameEn;
  late String nameAr;
  late String image;
  late String imageUrl;

  Categories();

  Categories.fromJson(dynamic json) {
    id = json['id'];
    nameEn = json['name_en'];
    nameAr = json['name_ar'];
    image = json['image'];
    imageUrl = json['image_url'];
  }


}

class Slider {
  late int id;
  late String url;
  late String imageUrl;

  Slider();

  Slider.fromJson(dynamic json) {
    id = json['id'];
    url = json['url'];
    imageUrl = json['image_url'];
  }

}
