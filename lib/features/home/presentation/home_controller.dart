import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/util/state.dart';
import '../model/home_request_model.dart';
import '../model/home_response_model.dart';
import '../repository/home_repository.dart';
import '../../detail_team/detail_team_route.dart';
import '../homepage_state.dart';

class HomeController extends GetxController {
  final HomeRepository _repository;
  HomeController(this._repository);
  List<Teams> list = [];
  HomePageState state = HomePageIdle();
  List<bool?> favoriteList = [];
  TextEditingController searchCtr = TextEditingController();

  @override
  void onInit() {
    _getCountHomeData();
    _onSearch();
    super.onInit();
  }

  void _onSearch() {
    searchCtr.addListener(() {
      var searchResult = searchCtr.text.toLowerCase();
      print('firman mulyawan $searchResult');
      // List<Teams> searchData = [];
      // searchData.addAll(list);
      List<Teams> searchData = list.where((element) {
        return element.strTeam!.toLowerCase().contains(searchResult);
      }).toList();

      list = searchData;
      update();
    });
  }

  void onRefresh() {
    _getCountHomeData();
    update();
  }

  _getCountHomeData() async {
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

  void toDetailProduct(element) {
    Get.toNamed(
      DetailTeamRoute.detailTeamScreen,
      arguments: element,
    );
  }

  void toggleFavoriteList(index) {
    final itemListFav = favoriteList[index];

    if (itemListFav == true) {
      favoriteList[index] = false;
      update();
    } else {
      favoriteList[index] = true;
      update();
    }
  }
}
