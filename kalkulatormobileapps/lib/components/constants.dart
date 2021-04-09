
class Constants{
  Constants._();
  static const double padding =10;
  static const double avatarRadius =10;
}

//FormValidation
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password short";
const String kMatchPassError = "Passwords don't match";