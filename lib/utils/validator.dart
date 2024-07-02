class Validator {
  //-----------------------------------email---------------------------
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }

    return null;
  }

  //-----------------------------------name---------------------------
  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }

    return null;
  }

//-----------------------------------number---------------------------
  String? numberValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a number';
    }

    if (!RegExp(r'^\+\d{1,3}\d{4,}$').hasMatch(value)) {
      return 'Please enter a valid number with country code';
    }
    return null;
  }

//-----------------------------------gender---------------------------
  String? genderValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a gender';
    }
    List<String> validGenders = ['Male', 'Female', 'Other'];
    if (!validGenders.contains(value)) {
      return 'Please select a valid gender';
    }
    return null;
  }

  String? passwordValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a password';
  }

  if (value.length < 8) {
    return 'Password must be at least 8 characters long';
  }

  if (!RegExp(r'^(?=.[a-z]).{8,}$').hasMatch(value)) {
    return 'Password must include uppercase, lowercase, number, and special character';
  }

  return null;
}


//----------EducationLevel ---------//

String? educationlevel(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Education Level';
    }

    return null;
  }

//---------Universityname------//
String? universityname(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your University Name/ College Name';
    }

    return null;
  }
  //----------Course-----------//
  String? course(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Course';
    }

    return null;
  }
  //-----Specislization------///
  String? specislization(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Specislization';
    }

    return null;
  }

  //------CourseType-------//
   String? coursetype(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Course Type';
    }

    return null;
  }
//----- CouseDuration -----//
 String? coursestating(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Course Staring Year';
    }

    return null;
  }

   String? courseending(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Course Ending Year';
    }

    return null;
  }
//-------grade------///
 String? grade(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your grade';
    }

    return null;
  }
  

}