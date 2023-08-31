import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConst {
  static String appName = "Assessment Firman";
  static bool isDebuggable = true;
  static String appUrl = "${dotenv.env['API_LINK']!}/api/";

  static String apiVersion({String version = "v1"}) {
    return version;
  }

  // images
  static String assetsLogo = 'assets/images/logo.png';
  static String assetsImageNF = 'assets/images/image_not_found.png';

  // ======== Icons svg
  static String assetHomePage = 'assets/icons/ic_beranda.svg';
  static String assetProfile = 'assets/icons/ic_profile.svg';
  static String assetIonicIosSearch = 'assets/icons/ic_ionic_ios_search.svg';
  static String assetFacebook = 'assets/icons/ic_facebook.svg';
  static String assetInstagram = 'assets/icons/ic_instagram.svg';
  static String assetTwitter = 'assets/icons/ic_twitter.svg';
  static String assetWebsite = 'assets/icons/ic_website.svg';
  static String assetYoutube = 'assets/icons/ic_youtube.svg';
}
