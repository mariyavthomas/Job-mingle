class Usermodel {
  String email;
  String password;
  String? uid;
  String name;
  String phone;
  String pic;
  String? location;
  String? resume;
  String? profileheadlines;
  String? education;
  String? profilesummery;
  String? experence;
  Usermodel(
      {required this.email,
      required this.password,
      this.experence,
      this.education,
      this.profileheadlines,
      this.profilesummery,
      this.uid,
      this.resume,
      this.location,
      required this.name,
      required this.pic,
      required this.phone});
  Map<String, dynamic> toJson() {
    return {
      "Full name": name,
      "Email": email,
      "Phone": phone,
      "Password": password,
      "uid": uid,
      "pic": pic,
      "location": location,
      "resume": resume,
      'experence': experence,
      'profileheadlines':profileheadlines,
      'profilesummery':profilesummery,
      'education':education,
    };
  }

  /// map user fetched from firebase to usermodel ////

  factory Usermodel.fromJson(Map<String, dynamic> json) {
    // final data= document.data()!;
    return Usermodel(
        uid: json['uid'] ?? "",
        experence: json['experence'] ?? "",
        education: json['education'],
        profileheadlines: json['profileheadlines'],
        profilesummery: json['profilesummery'],
        email: json['email'] ?? "",
        password: json["password"] ?? "",
        name: json["name"] ?? "",
        phone: json["phone"] ?? "",
        pic: json['pic'] ?? "",
        location: json['location'] ?? "",
        resume: json['resume'] ?? "",
       
        );
  }
}
