class API {
  static const hostConnect = "http://192.168.1.40/shopping_app_api";
  static const hostConnectUser = "$hostConnect/user";

  //sign up
  static const checkEmail = "$hostConnectUser/validate_email.php";
  static const signUp = "$hostConnectUser/signup.php";
}
