class Companymodel{
   String  companyemail;
   String  companypassword;
   String ?companyuid;
   String  companyname;
    String ? address;
   String ?industry;
   int ? numberOfEmployees;
   String ? website;
   String phone;
   Companymodel({
    required this.companyemail,
    required this.companypassword,
    this.companyuid,
    required this.companyname,
    this.address,
    this.industry,
   this.numberOfEmployees,
    this.website,
    required this.phone
   
   });
}