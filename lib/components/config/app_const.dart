import 'package:flutter_dotenv/flutter_dotenv.dart';

class LinkImage {
  String? linkUrl;
  String? image;

  LinkImage({this.linkUrl, this.image});
}

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
  static String assetFacebook = 'assets/icons/ic_facebook.svg';
  static String assetFavoriteBadge = 'assets/icons/ic_favorite_badge.svg';
  static String assetFavorite = 'assets/icons/ic_favorites.svg';
  static String assetInstagram = 'assets/icons/ic_instagram.svg';
  static String assetIonicIosSearch = 'assets/icons/ic_ionic_ios_search.svg';
  static String assetNotFavoriteBadge =
      'assets/icons/ic_not_favorite_badge.svg';
  static String assetTwitter = 'assets/icons/ic_twitter.svg';
  static String assetWebsite = 'assets/icons/ic_website.svg';
  static String assetYoutube = 'assets/icons/ic_youtube.svg';

  static List<LinkImage> dataImageSocialMedia = [
    LinkImage(linkUrl: "Website", image: assetWebsite),
    LinkImage(linkUrl: "Facebook", image: assetFacebook),
    LinkImage(linkUrl: "Instagram", image: assetInstagram),
    LinkImage(linkUrl: "Twitter", image: assetTwitter),
    LinkImage(linkUrl: "Youtube", image: assetYoutube),
  ];
}
