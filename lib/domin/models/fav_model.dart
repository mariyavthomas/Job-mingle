class FavModel {
  String useruid;
  String ? jobuid;
  String favuid;
  String? compantemail;
  String ?companyuid;
  String ?jobtitle;
  String? numberofopening;
  String ?dateofposting;
  String? timeofjobentering;
  String ?jobaddress;
  String ?experience;
  String? contactpersonnumber;
  String ?contactpersonname;
  String ?skill;
  String ?jobdecripation;
  String? country;
  String? state;
  String ?city;
  String? salary;
  String ?qualification;
  String ?jobtime;
  String ?interviewtime;
  bool? isFavorited;
  String  ?companyname;
  String? contactpersonprofile;
  FavModel({
    required this.companyname,
    required this.contactpersonprofile,
    required this.useruid,
    required this.isFavorited,
    required this.jobuid,
    required this.favuid,
    required this.compantemail,
    required this.companyuid,
    required this.jobtitle,
    required this.numberofopening,
    required this.dateofposting,
    required this.timeofjobentering,
    required this.jobaddress,
    required this.experience,
    required this.contactpersonnumber,
    required this.contactpersonname,
    required this.skill,
    required this.jobdecripation,
    required this.country,
    required this.state,
    required this.city,
    this.salary,
    required this.qualification,
    required this.jobtime,
    required this.interviewtime,
  });

  // Factory constructor to create an instance from a JSON map
  factory FavModel.fromJson(Map<String, dynamic> json) {
    return FavModel(
      companyname: json['companyname'],
      contactpersonprofile: json['contactpersonprofile'],
      isFavorited: json['isFavorited'],
      useruid: json['useruid'],
      jobuid: json['jobuid'],
      favuid: json['favuid'],
      compantemail: json['compantemail'],
      companyuid: json['companyuid'],
      jobtitle: json['jobtitle'],
      numberofopening: json['numberofopening'],
      dateofposting: json['dateofposting'],
      timeofjobentering: json['timeofjobentering'],
      jobaddress: json['jobaddress'],
      experience: json['experience'],
      contactpersonnumber: json['contactpersonnumber'],
      contactpersonname: json['contactpersonname'],
      skill: json['skill'],
      jobdecripation: json['jobdecripation'],
      country: json['country'],
      state: json['state'],
      city: json['city'],
      salary: json['salary'],
      qualification: json['qualification'],
      jobtime: json['jobtime'],
      interviewtime: json['interviewtime'],
    );
  }

  // Method to convert an instance to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'companyname':companyname,
      'contactpersonprofile':contactpersonprofile,
      'useruid': useruid,
      'jobuid': jobuid,
      'favuid': favuid,
      'compantemail': compantemail,
      'companyuid': companyuid,
      'jobtitle': jobtitle,
      'numberofopening': numberofopening,
      'dateofposting': dateofposting,
      'timeofjobentering': timeofjobentering,
      'jobaddress': jobaddress,
      'experience': experience,
      'contactpersonnumber': contactpersonnumber,
      'contactpersonname': contactpersonname,
      'skill': skill,
      'jobdecripation': jobdecripation,
      'country': country,
      'state': state,
      'city': city,
      'salary': salary,
      'qualification': qualification,
      'jobtime': jobtime,
      'interviewtime': interviewtime,
      'isFavorited':isFavorited
    };
  }
}
