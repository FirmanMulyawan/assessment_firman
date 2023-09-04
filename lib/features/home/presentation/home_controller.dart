import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../../../components/util/state.dart';
import '../../../components/util/storage_util.dart';
import '../model/home_request_model.dart';
import '../model/home_response_model.dart';
import '../repository/home_repository.dart';
import '../../detail_team/detail_team_route.dart';
import '../homepage_state.dart';
import '../../../components/config/app_style.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  final StorageUtil _storageUtil;

  final fb = FirebaseDatabase.instance.ref();
  List<Teams> list = [];
  HomePageState state = HomePageIdle();
  List<bool?> favoriteList = [];
  TextEditingController searchCtr = TextEditingController();

  HomeController(this._repository, this._storageUtil);

  @override
  void onInit() {
    _getListHomeData();
    super.onInit();
  }

  void onSearch(String value) {
    // final s = list.where((element) {
    //   final strTeam = element.strTeam?.toLowerCase();
    //   final query = value.toLowerCase();

    //   return strTeam!.contains(query);
    // }).toList();

    // list = s;
    // update();
  }

  void onRefresh() {
    _getListHomeData();
    update();
  }

  _getListHomeData() async {
    state = HomePageLoading();
    _repository.getListNewTransaction(
      req: HomeRequestModel(l: 'English Premier League'),
      response: ResponseHandler(
          onSuccess: (data) {
            list = data;
            for (var i = 0; i < data.length; i++) {
              favoriteList.add(true);
              favoriteList[i] = false;
            }

            state = HomePageLoadSuccess();
            update();
          },
          onFailed: (e, text) {
            state = HomePageError();
          },
          onDone: () => update()),
    );
  }

  void toDetailProduct(element) async {
    Teams data = element;

    final language = await _storageUtil.getLanguage();
    var currentLanguage = data.strDescriptionEN;

    if (language == "england") {
      currentLanguage = data.strDescriptionEN;
    } else if (language == "spain") {
      currentLanguage = data.strDescriptionES;
    } else if (language == "italy") {
      currentLanguage = data.strDescriptionIT;
    } else {
      currentLanguage = data.strDescriptionEN;
    }

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

  void toggleFavoriteList(index, listData) async {
    Teams data = listData;
    final itemListFav = favoriteList[index];
    if (itemListFav == false) {
      String key = fb.child("listFav").push().key ?? '';
      await fb.child('listFav').child(key).set({
        'key': key,
        'strTeam': data.strTeam,
        'intFormedYear': data.intFormedYear,
        'strStadium': data.strStadium,
        'strWebsite': data.strWebsite,
        'strFacebook': data.strFacebook,
        'strTwitter': data.strTwitter,
        'strInstagram': data.strInstagram,
        'strDescriptionEN': data.strDescriptionEN,
        'strDescriptionES': data.strDescriptionES,
        'strDescriptionIT': data.strDescriptionIT,
        'strYoutube': data.strYoutube,
        'strTeamBadge': data.strTeamBadge,
        'index': index
      }).then((value) {
        favoriteList[index] = true;
      });
      update();
    }
  }

  void changeLanguage(String lang) {
    if (lang == 'england') {
      _storageUtil.setLanguage('england');
    } else if (lang == 'spain') {
      _storageUtil.setLanguage('spain');
    } else if (lang == "italy") {
      _storageUtil.setLanguage('italy');
    }
  }
}
