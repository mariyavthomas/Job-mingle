class Usermodel {
  String email;
  String password;
  String? uid;
  String name;
  String phone;
  String pic;
  Usermodel(
      {required this.email,
      required this.password,
      this.uid,
      required this.name,
      required this.pic,
      required this.phone});
  Map<String, dynamic> toJson() {
    return {
      "Full name": name,
      "Email": email,
      "Phone": phone,
      "Password": password,
      "uid":uid,
      "pic":pic
    };
  }

  /// map user fetched from firebase to usermodel ////

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    // final data= document.data()!;
    return Usermodel(
        uid: json['uid'] ?? "",
        email: json['email'] ?? "",
        password: json["password"] ?? "",
        name: json["name"] ?? "",
        phone: json["phone"] ?? "",
        pic: json['pic'] ??""
        );
  }
}
