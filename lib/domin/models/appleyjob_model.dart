class AppliedJobModel {
  String companyuid;
  String jobid;
  String userid;
  String username;
  String experience;
  String skills;
  String education;
  String companyname;
  String salary;
  String jobaddress;
  String jobtiming;
  String interviewtime;
  String qualification;
  String experiencecomp;
  String jobtitle;
  String? appyuid;
  String country;
  String state;
  String city;
  String jobPostedDate;
  String userhigereducation;
  String userexperence;
  String userresume;
  String useruniversity;
  String usergrade;
  String usercourse;
  String usercousestaringyear;
  String usercourseendingyear;
  String userspecialice;
  String usermailid;
  String userphonenumber;
  String companyphonenumber;
  String companycontactperson;
  String conpanycontactpersonumber;
  String pic;
  String userprofileheadlines;
  String userprofilesummery;
  String usergender;
  String userlanguage;
  String userdob;
  String useruserjobtitle;
  String useraddress;
  String userhometown;
  String userpincode;
  String userworkstatus;
  String usercurrentcity;
  String usercurrentcategory;
  String usercurrentdeparment;
  String usercurrentindustry;
  String usercurrentjobrole;
  String ? candidatestatus;

  AppliedJobModel({
    this.candidatestatus,
    required this.userprofileheadlines,
    required this.userprofilesummery,
    required this.usergender,
    required this.userlanguage,
    required this.userdob,
    required this.useruserjobtitle,
    required this.useraddress,
    required this.userhometown,
    required this.userworkstatus,
    required this.userpincode,
    required this.usercurrentcity,
    required this.usercurrentcategory,
    required this.usercurrentdeparment,
    required this.usercurrentindustry,
    required this.usercurrentjobrole,
    required this.pic,
    required this.jobPostedDate,
    required this.city,
    required this.country,
    required this.state,
    required this.companyuid,
    required this.education,
    required this.experience,
    this.appyuid,
    required this.jobid,
    required this.skills,
    required this.userid,
    required this.username,
    required this.companyname,
    required this.experiencecomp,
    required this.interviewtime,
    required this.jobaddress,
    required this.jobtiming,
    required this.jobtitle,
    required this.qualification,
    required this.salary,
    required this.companycontactperson,
    required this.companyphonenumber,
    required this.conpanycontactpersonumber,
    required this.usercourse,
    required this.usercourseendingyear,
    required this.usercousestaringyear,
    required this.userexperence,
    required this.usergrade,
    required this.userhigereducation,
    required this.usermailid,
    required this.userphonenumber,
    required this.userresume,
    required this.userspecialice,
    required this.useruniversity,
  });

  factory AppliedJobModel.fromJson(Map<String, dynamic> json) {
    return AppliedJobModel(
      candidatestatus: json['candidatestatus'] ?? "",
      userprofileheadlines: json['userprofileheadlines'] ?? "",
      userprofilesummery: json['userprofilesummery'] ?? "",
      usergender: json['usergender'] ?? "",
      userlanguage: json['userlanguage'] ?? "",
      userdob: json['userdob'] ?? "",
      useruserjobtitle: json['useruserjobtitle'] ?? "",
      useraddress: json['useraddress'] ?? "",
      userhometown: json['userhometown'] ?? "",
      userworkstatus: json['userworkstatus'] ?? "",
      userpincode: json['userpincode'] ?? "",
      usercurrentcity: json['usercurrentcity'] ?? "",
      usercurrentcategory: json['usercurrentcategory'] ?? "",
      usercurrentdeparment: json['usercurrentdeparment'] ?? "",
      usercurrentindustry: json['usercurrentindustry'] ?? "",
      usercurrentjobrole: json['usercurrentjobrole'] ?? "",
      pic: json['pic'] ?? "",
      jobPostedDate: json['jobPostedDate'] ?? "",
      city: json['city'] ?? "",
      country: json['country'] ?? "",
      state: json['state'] ?? "",
      companyuid: json['companyuid'] ?? "",
      education: json['education'] ?? "",
      experience: json['experience'] ?? "",
      appyuid: json['appyuid'],
      jobid: json['jobid'] ?? "",
      skills: json['skills'] ?? "",
      userid: json['userid'] ?? "",
      username: json['username'] ?? "",
      companyname: json['companyname'] ?? "",
      experiencecomp: json['experiencecomp'] ?? "",
      interviewtime: json['interviewtime'] ?? "",
      jobaddress: json['jobaddress'] ?? "",
      jobtiming: json['jobtiming'] ?? "",
      jobtitle: json['jobtitle'] ?? "",
      qualification: json['qualification'] ?? "",
      salary: json['salary'] ?? "",
      companycontactperson: json['companycontactperson'] ?? "",
      companyphonenumber: json['companyphonenumber'] ?? "",
      conpanycontactpersonumber: json['conpanycontactpersonumber'] ?? "",
      usercourse: json['usercourse'] ?? "",
      usercourseendingyear: json['usercourseendingyear'] ?? "",
      usercousestaringyear: json['usercousestaringyear'] ?? "",
      userexperence: json['userexperence'] ?? "",
      usergrade: json['usergrade'] ?? "",
      userhigereducation: json['userhigereducation'] ?? "",
      usermailid: json['usermailid'] ?? "",
      userphonenumber: json['userphonenumber'] ?? "",
      userresume: json['userresume'] ?? "",
      userspecialice: json['userspecialice'] ?? "",
      useruniversity: json['useruniversity'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['candidatestatus']=this.candidatestatus;
    data['userprofileheadlines'] = this.userprofileheadlines;
    data['userprofilesummery'] = this.userprofilesummery;
    data['usergender'] = this.usergender;
    data['userlanguage'] = this.userlanguage;
    data['userdob'] = this.userdob;
    data['useruserjobtitle'] = this.useruserjobtitle;
    data['useraddress'] = this.useraddress;
    data['userhometown'] = this.userhometown;
    data['userworkstatus'] = this.userworkstatus;
    data['userpincode'] = this.userpincode;
    data['usercurrentcity'] = this.usercurrentcity;
    data['usercurrentcategory'] = this.usercurrentcategory;
    data['usercurrentdeparment'] = this.usercurrentdeparment;
    data['usercurrentindustry'] = this.usercurrentindustry;
    data['usercurrentjobrole'] = this.usercurrentjobrole;
    data['pic'] = this.pic;
    data['jobPostedDate'] = this.jobPostedDate;
    data['city'] = this.city;
    data['country'] = this.country;
    data['state'] = this.state;
    data['companyuid'] = this.companyuid;
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['appyuid'] = this.appyuid;
    data['jobid'] = this.jobid;
    data['skills'] = this.skills;
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['companyname'] = this.companyname;
    data['experiencecomp'] = this.experiencecomp;
    data['interviewtime'] = this.interviewtime;
    data['jobaddress'] = this.jobaddress;
    data['jobtiming'] = this.jobtiming;
    data['jobtitle'] = this.jobtitle;
    data['qualification'] = this.qualification;
    data['salary'] = this.salary;
    data['companycontactperson'] = this.companycontactperson;
    data['companyphonenumber'] = this.companyphonenumber;
    data['conpanycontactpersonumber'] = this.conpanycontactpersonumber;
    data['usercourse'] = this.usercourse;
    data['usercourseendingyear'] = this.usercourseendingyear;
    data['usercousestaringyear'] = this.usercousestaringyear;
    data['userexperence'] = this.userexperence;
    data['usergrade'] = this.usergrade;
    data['userhigereducation'] = this.userhigereducation;
    data['usermailid'] = this.usermailid;
    data['userphonenumber'] = this.userphonenumber;
    data['userresume'] = this.userresume;
    data['userspecialice'] = this.userspecialice;
    data['useruniversity'] = this.useruniversity;
    return data;
  }
}
