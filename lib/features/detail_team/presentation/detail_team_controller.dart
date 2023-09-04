import 'package:assessment_firman/components/config/app_style.dart';
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
  String currentLanguage = '';
  String strYoutube = '';
  String strTeamBadge = '';

  @override
  void onInit() {
    var data = Get.arguments;
    Teams dataArgs = data[0];
    strTeam = dataArgs.strTeam ?? '';
    intFormedYear = dataArgs.intFormedYear ?? '';
    strStadium = dataArgs.strStadium ?? '';
    strWebsite = dataArgs.strWebsite ?? '';
    strFacebook = dataArgs.strFacebook ?? '';
    strTwitter = dataArgs.strTwitter ?? '';
    strInstagram = dataArgs.strInstagram ?? '';
    currentLanguage = data[1];
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
        Get.snackbar(
          "Error",
          'Data not Found',
          snackPosition: SnackPosition.TOP,
          colorText: AppStyle.white,
          backgroundColor: AppStyle.secondaryGreen,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        'Data not Found',
        snackPosition: SnackPosition.TOP,
        colorText: AppStyle.white,
        backgroundColor: AppStyle.secondaryGreen,
      );
    }
  }
}
