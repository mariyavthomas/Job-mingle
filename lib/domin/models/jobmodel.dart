class JobModel {
  
  List<dynamic>? joblist;
  String  jobid;
  String companyemail;
  String? companyuid;
  String companyname;
  String jobtitle;
  String numberofopening;
  String dateofposting;
  String timeofjobentering;
  String jobaddress;
  String experience;
  String contactpersonprofile;
  String contactpersonname;
  String skill;
  String jobdecripation;
  String contactpersonnumber;
  String country;
  String state;
  String city;

  JobModel({
    required this.jobid,
    
    this.joblist,
    required this.country,
    required this.city,
    required this.state,
    required this.contactpersonnumber,
    required this.companyemail,
    this.companyuid,
    required this.companyname,
    required this.jobdecripation,
    required this.contactpersonname,
    required this.contactpersonprofile,
    required this.dateofposting,
    required this.experience,
    required this.jobaddress,
    required this.jobtitle,
    required this.numberofopening,
    required this.skill,
    required this.timeofjobentering,
  });

  factory JobModel.fromJson(Map<String, dynamic> json) {
    return JobModel(
    //  jobname: json['jobname'] ?? "",
      jobid: json['jobid'] ?? "",
      
      companyemail: json['companyemail'] ?? "",
      companyuid: json['companyuid'] ?? "",
      companyname: json['companyname'] ?? "",
      contactpersonnumber: json['contactpersonnumber'] ?? "",
      jobtitle: json['jobtitle'] ?? "",
      numberofopening: json['numberofopening'] ?? "",
      dateofposting: json['dateofposting'] ?? "",
      timeofjobentering: json['timeofjobentering'] ?? "",
      jobaddress: json['jobaddress'] ?? "",
      experience: json['experience'] ?? "",
      contactpersonprofile: json['contactpersonprofile'] ?? "",
      contactpersonname: json['contactpersonname'] ?? "",
      skill: json['skill'] ?? "",
      jobdecripation: json['jobdecripation'] ?? "",
      country: json['country'] ?? "",
      city: json['city'] ?? "",
      state: json['state'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> snapshot = <String, dynamic>{};
    //snapshot['jobname'] = this.jobname;
    snapshot['jobid'] = this.jobid;
  
    snapshot['companyemail'] = this.companyemail;
    snapshot['companyuid'] = this.companyuid;
    snapshot['companyname'] = this.companyname;
    snapshot['contactpersonnumber'] = this.contactpersonnumber;
    snapshot['jobtitle'] = this.jobtitle;
    snapshot['numberofopening'] = this.numberofopening;
    snapshot['dateofposting'] = this.dateofposting;
    snapshot['timeofjobentering'] = this.timeofjobentering;
    snapshot['jobaddress'] = this.jobaddress;
    snapshot['experience'] = this.experience;
    snapshot['contactpersonprofile'] = this.contactpersonprofile;
    snapshot['contactpersonname'] = this.contactpersonname;
    snapshot['skill'] = this.skill;
    snapshot['jobdecripation'] = this.jobdecripation;
    snapshot['country'] = this.country;
    snapshot['city'] = this.city;
    snapshot['state'] = this.state;

    return snapshot;
  }
}
