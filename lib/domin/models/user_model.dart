class Usermodel{
  String ? email;
  String  ? password;
  String ?uid;
  String ?name;
  String ?phone;
  String ?pic;
  Usermodel({
    required this.email,
    required this.password,
     this.uid,
    required this.name,
    this.pic,
    required this.phone
  });
}