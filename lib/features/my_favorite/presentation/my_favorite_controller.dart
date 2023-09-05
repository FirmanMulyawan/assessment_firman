import 'package:assessment_firman/components/config/app_style.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../detail_team/detail_team_route.dart';
import '../../home/presentation/home_controller.dart';

import '../../home/model/home_response_model.dart';
import '../../../components/util/storage_util.dart';

class MyFavoriteController extends GetxController {
  final fb = FirebaseDatabase.instance.ref();
  final StorageUtil _storageUtil;
  final _homeController = Get.find<HomeController>();
  MyFavoriteController(this._storageUtil);

  void toDetailProduct(value) async {
    final language = await _storageUtil.getLanguage();
    var currentLanguage = value['strDescriptionEN'];

    if (language == "england") {
      currentLanguage = value['strDescriptionEN'];
    } else if (language == "spain") {
      currentLanguage = value['strDescriptionES'];
    } else if (language == "italy") {
      currentLanguage = value['strDescriptionIT'];
    } else {
      currentLanguage = value['strDescriptionEN'];
    }

    final element = Teams(
      strTeam: value['strTeam'],
      intFormedYear: value['intFormedYear'],
      strStadium: value['strStadium'],
      strWebsite: value['strWebsite'],
      strFacebook: value['strFacebook'],
      strTwitter: value['strTwitter'],
      strInstagram: value['strInstagram'],
      strDescriptionEN: value['strDescriptionEN'],
      strDescriptionES: value['strDescriptionES'],
      strDescriptionIT: value['strDescriptionIT'],
      strYoutube: value['strYoutube'],
      strTeamBadge: value['strTeamBadge'],
    );

    if (currentLanguage != null) {
      Get.toNamed(
        DetailTeamRoute.detailTeamScreen,
        arguments: [element, currentLanguage],
      );
    } else {
      Get.snackbar(
        "Data not found",
        'please set the language again',
        snackPosition: SnackPosition.TOP,
        colorText: AppStyle.white,
        backgroundColor: AppStyle.secondaryGreen,
      );
    }
  }

  void toDeleteListFav(key, index) async {
    _homeController.favoriteList[index] = false;
    update();
    await fb.child("listFav").child(key).remove();
  }
}
