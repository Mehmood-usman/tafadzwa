

class FieldValidator{
  static String? validateEmail(String vale){
    vale= vale.toLowerCase();
    if(vale.isEmpty) return "Enter Email";

    String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp =  RegExp(pattern);

    if(!regExp.hasMatch(vale)) return "Enter valid email";

    return null;
  }

  String? validatePassword(String value){
    if(value.isEmpty) return "Enter password";

    if(value.length<7) return "Password length must be more than 6 characters";

    return null;
  }
}