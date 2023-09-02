import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../components/config/app_style.dart';
import '../../../components/widget/empty_data.dart';
import '../../../components/widget/card_item.dart';
import '../../../components/widget/search_input.dart';
import '../../../components/config/app_const.dart';

import './widget_home_page/item_loading_home.dart';
import '../homepage_state.dart';
import './home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppStyle.white,
        appBar: _appBar(),
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
        output.add(const SizedBox(height: 10));
        for (var i = 0; i < listData.length; i++) {
          output.add(
            CardItem(
              data: listData[i],
              onTap: () => ctrl.toDetailProduct(listData[i]),
              onTapfavorite: () => ctrl.toggleFavoriteList(i),
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
                  color: AppStyle.bluePrimary,
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
        for (var i = 0; i < 8; i++) {
          output.add(const ItemLoadingHome());
        }

        return Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: output,
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
