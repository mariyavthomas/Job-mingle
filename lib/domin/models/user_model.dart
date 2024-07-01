class Usermodel {
  String ?email;
  String ?password;
  String? uid;
  String ?name;
  String? phone;
  String? pic;
  String? location;
  String? resume;
  String? profileheadlines;
  String? education;
  String? profilesummery;
  String? experence;
  String ?higereducation;
  String ?universitynamecollegename;
  String ? course;
  String ?specialization;
  String ?coursetype;
  String ?courseStaringyear;
  String ?courseendingyear;
  String ?grade;
  Usermodel(
      {

      this.email,
      this.password,
      this.experence,
      this.education,
      this.profileheadlines,
      this.profilesummery,
      this.uid,
      this.resume,
      this.location,
      this.name,
      this.pic,
      this.phone,
      this.course,
      this.courseStaringyear,
      this.courseendingyear,
      this.coursetype,
      this.grade,
      this.higereducation,
      this.specialization,
      this.universitynamecollegename
      });
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
      'course':course,
      'courseStaringyear':courseStaringyear,
      'courseendingyear':courseendingyear,
      'coursetype':coursetype,
      'higereducation':higereducation,
      'specialization':specialization,
      'universitynamecollegename':universitynamecollegename,
      'grade':grade

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
        course: json['course'] ?? "",
        courseStaringyear: json['courseStaringyear'] ?? "",
        courseendingyear: json['courseendingyear'] ?? "",
        coursetype: json['coursetype'] ?? "",
        grade: json['grade'] ?? "",
        higereducation: json['higereducation'] ?? "",
        specialization: json['specialization'] ?? ""

       
        );
  }
}
