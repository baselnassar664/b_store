class User {
 late int id;
 late String fullName;
 late String phone;
 late String city;
 late String gender;
 late String? fcmToken;
 late String token;
 late String refreshToken;
 late bool isActive;

 User();

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phone = json['phone'];
    city=json['city'];
    gender = json['gender'];
    fcmToken = json['fcm_token'];
    token = json['token'];
    refreshToken = json['refresh_token'];
    isActive = json['is_active'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['city']=this.city;
    data['phone'] = this.phone;
    data['gender'] = this.gender;
    data['fcm_token'] = this.fcmToken;
    data['token'] = this.token;
    data['refresh_token'] = this.refreshToken;
    data['is_active'] = this.isActive;
    return data;
  }
}