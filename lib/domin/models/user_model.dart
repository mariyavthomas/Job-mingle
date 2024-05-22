class Usermodel{
  String ? email;
  String  ? password;
  String ?uid;
  String ?name;
  String ?phone;
  Usermodel({
    required this.email,
    required this.password,
     this.uid,
    required this.name,
    required this.phone
  });
}