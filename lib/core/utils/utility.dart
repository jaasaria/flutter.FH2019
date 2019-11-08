import 'dart:math' show Random;
import 'package:fh2019/core/config/app.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static int generateRandomNumber(int max) {
    var rng = new Random();
    return rng.nextInt(max);
  }

  static void dialNumber(String phoneNo) async {
    String strPhoneNo = 'tel:$phoneNo';
    if (await canLaunch(strPhoneNo)) {
      await launch(strPhoneNo);
    } else {
      throw 'Could not launch $strPhoneNo';
    }
  }

  static void email() async {
    String email = App.authorEmail['address'];
    String subject = App.authorEmail['subject'];

    String strEmail = 'mailto:$email?subject=$subject';
    if (await canLaunch(strEmail)) {
      await launch(strEmail);
    } else {
      throw 'Could not launch $strEmail';
    }
  }

  static void openBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static openMap(double latitude, double longitude) async {
    // You may check this:
    // var googleUrl = 'geo:$latitude,$longitude';
    // var googleUrl = 'google.navigation:q=$latitude,$longitude';
    var googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}
