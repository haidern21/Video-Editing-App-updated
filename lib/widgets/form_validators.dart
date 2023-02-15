import 'package:get/get.dart';

String? nameValidator(String? value) {
  if (value!.isEmpty) {
    return "Please enter your name";
  }
  return null;
}

String? emailValidator(String? value) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter a email";
  } else if (!regex.hasMatch(value)) {
    return 'Email format is invalid';
  }
  return null;
}

String? isMobileNumberValid(String? value) {
  String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  var regExp = new RegExp(regexPattern);

  if (value!.isEmpty) {
    return "Please enter your number";
  }
  return null;
}

String? bdayValidator(String? value) {
  if (value!.isEmpty) {
    return "Please enter your name";
  }
  return null;
}

String? passwordValidator(String? value) {
  String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  RegExp regex = RegExp(pattern);
  if (value!.isEmpty) {
    return "Please enter a password";
  } else if (!regex.hasMatch(value)) {
    return 'Password must contain the following:\n8 to 16 characters\nA lowercase letter\nA uppercase letter\nA number';
  }
  return null;
}

String? cardValidator(String value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value!.isPhoneNumber) {
    return "Please enter 16 Digit Card Number";
  }
  // } else if (!regex.hasMatch(value)) {
  //   return 'Password must contain the following:\n8 to 16 characters\nA lowercase letter\nA uppercase letter\nA number';
  // }
  return null;
}

String? cvvValidator(String value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value.length < 3) {
    return "Please enter 3 Digit ";
  }
  return null;
}

String? heightValidator(String value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value.length < 1) {
    return "Please enter Height ";
  }
  return null;
}

String? ageValidator(String value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value.length < 1) {
    return "Please enter Age ";
  }
  return null;
}

String? weightValidator(String value) {
  // String pattern = r'(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,16}';
  // RegExp regex = RegExp(pattern);
  if (value.length < 1) {
    return "Please enter Wight ";
  }
  return null;
}

String? positionValidator(String? value) {
  if (value!.isEmpty) {
    return "Please enter player"
        "\nposition";
  }
  return null;
}

String? commentsValidator(String? value) {
  if (value!.isEmpty) {
    return "Comment is empty!";
  }
  if (value.length < 5) {
    return "Comment is too short!";
  }
  return null;
}

String? projectTitleValidator(String? value) {
  if (value!.isEmpty) {
    return "Title is empty!";
  }
  if (value.length < 5) {
    return "Title is too short!";
  }
  return null;
}

String? videoCountValidator(String? value) {
  if (value!.isEmpty) {
    return "Video count is empty!";
  }
  return null;
}

String? durationValidator(String? value) {
  if (value!.isEmpty) {
    return "Video Duration is empty!";
  }
  return null;
}

String? driveUrlValidator(String? value) {
  if (value!.isEmpty) {
    return "Enter Url";
  }
  if (value.length < 5) {
    return "Enter Valid Url";
  }
  if (value.contains('http') == false) {
    return "Enter Valid Url";
  }
  if (value.contains('/') == false) {
    return "Enter Valid Url";
  }
  if (value.contains(':') == false) {
    return "Enter Valid Url";
  }
  if (value.contains('.') == false) {
    return "Enter Valid Url";
  }
  return null;
}

String? descriptionValidator(String? value) {
  if (value!.isEmpty) {
    return "Description is empty!";
  }
  if (value.length < 10) {
    return "Description is too short!";
  }
  return null;
}
