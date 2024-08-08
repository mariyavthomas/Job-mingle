part of 'personinfo_bloc.dart';

sealed class PersoninfoEvent extends Equatable {
  const PersoninfoEvent();

  @override
  List<Object> get props => [];
}

class SavePersonalinfo extends PersoninfoEvent {
  String? email;
  String? phone;
  String? gender;
  String? dob;
  String? language;
  String? address;
  String? pincode;
  String? hometown;
  SavePersonalinfo(
      {required this.address,
      required this.pincode,
      required this.hometown,
      required this.dob,
      required this.email,
      required this.gender,
      required this.language,
      required this.phone});
}
