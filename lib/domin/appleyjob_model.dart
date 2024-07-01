class AppleyedjobModel {
  String companyuid;
  String jobid;
  String userid;
  String username;
  String jobname;
  String experience;
  String skills;
  String education;
  AppleyedjobModel(
      {required this.companyuid,
      required this.education,
      required this.experience,
      required this.jobid,
      required this.jobname,
      required this.skills,
      required this.userid,
      required this.username});

  factory AppleyedjobModel.fromJson(Map<String, dynamic> json) {
    return AppleyedjobModel(
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

    return data;
  }
}
