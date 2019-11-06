class App {
//   static String baseUrl = "http://192.168.1.127:80/";
  static String baseUrl = "http://192.168.100.105:80/";
  //Note: Virtual Url will not applied. Use Local IP connection
  static String baseUrlWP = baseUrl + "api/v1/"; //with prefix

  static String name = "Tarlac Electric Inc.";
  static String owner = "";

  static String playStoreApp =
      "https://play.google.com/store/apps/details?id=org.ns.nsjaafinest&hl=en";

  static String playStoreAllApp =
      "https://play.google.com/store/apps/developer?id=john+andrew+asaria";

  static String appStore = "";

  static String privacy = "https://company.meralco.com.ph/privacy-policy";

  static const Map<String, String> authorEmail = {
    'subject': 'TEI MOBILE APP',
    'address': 'teiph@gmail.com',
  };
}
