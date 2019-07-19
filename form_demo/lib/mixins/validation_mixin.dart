

class ValidationMixin{
  String validateFirstName(String value){
    if(value.length < 2)
      return "Name length must be more than 2 character";
    return null;
  }
  String validateLastName(String value){
    if(value.length < 2)
      return "Surname length must be more than 2 character";
    return null;
  }
  String validateEmail(String value){
    if(!value.contains("@"))
      return "Mail must include '@'!";
    return null;
  }
}