import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/model/home_response_model.dart';

class DetailTeamController extends GetxController {
  DetailTeamController();
  String strTeam = '';
  String intFormedYear = '';
  String strStadium = '';
  String strWebsite = '';
  String strFacebook = '';
  String strTwitter = '';
  String strInstagram = '';
  String strDescriptionEN = '';
  String strYoutube = '';
  String strTeamBadge = '';

  @override
  void onInit() {
    var data = Get.arguments;
    Teams dataArgs = data;
    strTeam = dataArgs.strTeam ?? '';
    intFormedYear = dataArgs.intFormedYear ?? '';
    strStadium = dataArgs.strStadium ?? '';
    strWebsite = dataArgs.strWebsite ?? '';
    strFacebook = dataArgs.strFacebook ?? '';
    strTwitter = dataArgs.strTwitter ?? '';
    strInstagram = dataArgs.strInstagram ?? '';
    strDescriptionEN = dataArgs.strDescriptionEN ?? '';
    strYoutube = dataArgs.strYoutube ?? '';
    strTeamBadge = dataArgs.strTeamBadge ?? '';
    super.onInit();
  }

  void handleLinkUrl(socialMedia) {
    var url = strWebsite;
    if (socialMedia == "Website") {
    } else if (socialMedia == "Facebook") {
      url = strFacebook;
    } else if (socialMedia == "Instagram") {
      url = strInstagram;
    } else if (socialMedia == "Twitter") {
      url = strTwitter;
    } else if (socialMedia == "Youtube") {
      url = strYoutube;
    }

    if (url.isNotEmpty) {
      openBrowserUrl(url);
    }
  }

  void openBrowserUrl(String urls) async {
    // 'https://google.com'
    var url = Uri.parse(urls);

    try {
      if (await canLaunchUrl(url)) {
        launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar("Error", "Data not Found");
      }
    } catch (e) {
      Get.snackbar("Error", "Data not Found");
    }
  }
}
