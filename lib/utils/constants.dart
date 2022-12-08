class Constants {
  // static String apiUrl = "https://freestyleleague.azurewebsites.net/freestyle";
  static String apiUrl = "http://192.168.10.100:8080/freestyle";

  static String registerUrl = "$apiUrl/api/auth/register";
  static String loginUrl = "$apiUrl/api/auth/login";
  static String addProfileUrl = "$apiUrl/api/profile/addProfile/";
  static String allUsersUrl = "$apiUrl/api/user/users";
  static String isStagenameUrl = "$apiUrl/api/user/";
  static String profileDetailsUrl = "$apiUrl/api/profile/get/";
  static String downloadPictureUrl = "$apiUrl/api/profile/downloadPicture/";
}
