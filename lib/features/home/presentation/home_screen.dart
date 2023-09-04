import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../components/config/app_style.dart';
import '../../../components/widget/empty_data.dart';
import '../../../components/widget/card_item.dart';
import '../../../components/widget/search_input.dart';
import '../../../components/config/app_const.dart';
import '../../../components/widget/item_loading_home.dart';
import '../homepage_state.dart';
import './home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.white,
        appBar: _appBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: GetBuilder<HomeController>(builder: (ctrl) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: SpeedDial(
              animatedIcon: AnimatedIcons.menu_close,
              backgroundColor: AppStyle.blue,
              spacing: 8.0,
              children: [
                SpeedDialChild(
                  onTap: () {
                    ctrl.changeLanguage('england');
                  },
                  label: 'United Kingdom',
                  child: SvgPicture.asset(
                    AppConst.assetUK,
                    fit: BoxFit.contain,
                  ),
                ),
                SpeedDialChild(
                  onTap: () {
                    ctrl.changeLanguage('spain');
                  },
                  label: 'Spain',
                  child: SvgPicture.asset(
                    AppConst.assetSpain,
                    fit: BoxFit.contain,
                  ),
                ),
                SpeedDialChild(
                  onTap: () {
                    ctrl.changeLanguage('italy');
                  },
                  label: 'Italy',
                  child: SvgPicture.asset(
                    AppConst.assetItaly,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          );
        }),
        body: _productPrice(context));
  }

  _appBar() {
    return AppBar(
        centerTitle: true,
        elevation: 3,
        title: GetBuilder<HomeController>(builder: (ctx) {
          return WidgetSearchInput(
            hintText: 'Search ',
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            errorMaxLines: 2,
            enableInteractiveSelection: false,
            controller: ctx.searchCtr,
            readOnly: ctx.list.isEmpty ? true : false,
            onChanged: (value) {
              ctx.onSearch(value);
            },
          );
        }));
  }

  Widget _productPrice(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      final state = ctrl.state;
      final listData = ctrl.list;
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;

      if (state is HomePageLoadSuccess) {
        List<Widget> output = [];
        output.add(const SizedBox(height: 5));
        for (var i = 0; i < listData.length; i++) {
          output.add(
            CardItem(
              strTeam: listData[i].strTeam ?? '',
              strTeamBadge: listData[i].strTeamBadge ?? '',
              onTap: () => ctrl.toDetailProduct(listData[i]),
              handleRight: () => ctrl.toggleFavoriteList(i, listData[i]),
              assetItem: ctrl.favoriteList[i] == true
                  ? AppConst.assetFavoriteBadge
                  : AppConst.assetNotFavoriteBadge,
            ),
          );
        }
        output.add(const SizedBox(height: 100));

        return Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                padding: const EdgeInsets.only(top: 5),
                child: RefreshIndicator(
                  onRefresh: () async =>
                      Future<void>.delayed(const Duration(seconds: 1)).then(
                    (value) => ctrl.onRefresh(),
                  ),
                  color: AppStyle.appTheme,
                  backgroundColor: AppStyle.white,
                  strokeWidth: 4.0,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: output,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
          ],
        );
      }

      if (state is HomePageLoading) {
        List<Widget> output = [];
        output.add(const SizedBox(height: 5));
        for (var i = 0; i < 8; i++) {
          output.add(const ItemLoadingHome());
        }
        output.add(const SizedBox(height: 100));

        return Column(
          children: [
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: SingleChildScrollView(
                  child: Column(
                    children: output,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.07,
            ),
          ],
        );
      }

      if (state is HomePageEmpty) {
        return EmptyData(width: width * 0.5);
      }

      return Container();
    });
  }
}
