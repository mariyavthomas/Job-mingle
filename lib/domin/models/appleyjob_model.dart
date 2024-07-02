

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
  String ? appyuid;
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
 

  AppliedJobModel({
   
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
      //appyuid: json['appyuid'] ?? "",
      companyname: json['companyname'] ?? "",
      experiencecomp: json['experiencecomp'] ?? "",
      interviewtime: json['interviewtime'] ?? "",
      jobaddress: json['jobaddress'] ?? "",
      jobtiming: json['jobtiming'] ?? "",
      jobtitle: json['jobtitle'] ?? "",
      qualification: json['qualification'] ?? "",
      salary: json['salary'] ?? "",
      companyuid: json['companyuid'] ?? "",
      education: json['education'] ?? "",
      experience: json['experience'] ?? "",
      jobid: json['jobid'] ?? "",
      skills: json['skills'] ?? "",
      userid: json['userid'] ?? "",
      username: json['username'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['companyuid'] = this.companyuid;
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['jobid'] = this.jobid;
    data['skills'] = this.skills;
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['companyname'] = this.companyname;
    data['interviewtime'] = this.interviewtime;
    data['experiencecomp'] = this.experiencecomp;
    data['jobaddress'] = this.jobaddress;
    data['jobtitle'] = this.jobtitle;
    data['jobtiming'] = this.jobtiming;
    data['qualification'] = this.qualification;
    data['salary'] = this.salary;
    data['appyuid'] = this.appyuid;
    data['userhigereducation'] = this.userhigereducation;
    data['userexperence'] = this.userexperence;
    data['userresume'] = this.userresume;
    data['useruniversity'] = this.useruniversity;
    data['usergrade'] = this.usergrade;
    data['usercourse'] = this.usercourse;
    data['usercousestaringyear'] = this.usercousestaringyear;
    data['usercourseendingyear'] = this.usercourseendingyear;
    data['userspecialice'] = this.userspecialice;
    data['usermailid'] = this.usermailid;
    data['userphonenumber'] = this.userphonenumber;
    data['companyphonenumber'] = this.companyphonenumber;
    data['companycontactperson'] = this.companycontactperson;
    data['conpanycontactpersonumber'] = this.conpanycontactpersonumber;
    return data;
  }
}
