class AppleyedjobModel {
  String companyuid;
  String jobid;
  String userid;
  String username;
  String jobname;
  String experience;
  String skills;
  String education;
  String companyname;
  String salary;
  String jobaddress;
  String jobtiming;
  String interviewtime;
  String qualification;
   String experencecomp;
   String jobtitle;
  AppleyedjobModel(
      {required this.companyuid,
      required this.education,
      required this.experience,
      required this.jobid,
      required this.jobname,
      required this.skills,
      required this.userid,
      required this.username,
      required this.companyname,
      required this.experencecomp,
      required this.interviewtime,
      required this.jobaddress,
      required this.jobtiming,
      required this.jobtitle,
      required this.qualification,
      required this.salary
      
      });

  factory AppleyedjobModel.fromJson(Map<String, dynamic> json) {
    return AppleyedjobModel(
      companyname: json['companyname'] ?? "",
      experencecomp: json['experencecomp'] ?? "" ,
      interviewtime:  json['interviewtime'] ?? "",
      jobaddress: json['jobaddress'] ?? "" ,
      jobtiming:  json['jobtiming'] ?? "",
      jobtitle:  json['jobtitle'] ?? "",
      qualification:  json['qualification'] ?? "",
      salary: json['salary'] ?? "" ,

        companyuid: json['companyuid'] ?? "",
        education: json['education'] ?? "",
        experience: json['experience'] ?? "",
        jobid: json['jobid'] ?? "",
        jobname: json['jobname'] ?? "",
        skills: json['skills'] ?? "",
        userid: json['userid'] ?? "",
        username: json['username'] ?? "");
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['companyuid'] = this.companyuid;
    data['education'] = this.education;
    data['experience'] = this.experience;
    data['jobid'] = this.jobid;
    data['jobname'] = this.jobname;
    data['skills'] = this.skills;
    data['userid'] = this.userid;
    data['username'] = this.username;
    data['companyname'] =this.companyname;
    data['interviewtime']= this.interviewtime;
    data['experencecomp']=this.experencecomp;
    data['jobaddress']= this.jobaddress;
    data['jobtitle']=this.jobtitle;
    data['jobtiming']=this.jobtiming;
    data['qualification']=this.qualification;
    data['salary']=this.salary;

    return data;
  }
}
