class Companymodel{
   String ? companyemail;
   String ? companypassword;
   String ? companyuid;
   String ? companyname;
    String ? address;
   String ?industry;
   int ? numberOfEmployees;
   String ? website;
   Companymodel({
    required this.companyemail,
    required this.companypassword,
    this.companyuid,
    required this.companyname,
    required this.address,
    required this.industry,
    required this.numberOfEmployees,
    required this.website

   });
}