import 'package:get/get.dart';
import 'package:assessment_firman/features/home/model/home_transaction_history_response_model.dart';

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
    super.onInit();
  }
}
