class User{
  static String defaulAvatar  = "";
  int userId;
  String phone;
  String nickname;
  String avatar;
  String sessionToken;
  User();

  User.fromJson(Map<String,dynamic>json){
    userId = json['userId'];
    phone = json['phone'];
    nickname = json['nickname'];
    avatar = json['avatar'];
    sessionToken = json['token'];
  }

   Map<String, dynamic> toJson() => {
    'userId': userId,
    'phone': phone,
    'nickname': nickname,
    'avatar': avatar,
    'token': sessionToken,
  };
}