import 'package:assessment_firman/components/widget/search_input.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../../components/config/app_style.dart';
import '../../../../components/widget/empty_data.dart';

import 'widget_home_page/item_loading_home.dart';
import 'homepage_controller.dart';
import './homepage_state.dart';
import './widget_home_page/card_item.dart';

class HomePageScreen extends GetView<HomePageController> {
  const HomePageScreen({super.key});

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
      title: const WidgetSearchInput(
        hintText: 'Search ',
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
      ),
    );
  }

  Widget _productPrice(BuildContext context) {
    return GetBuilder<HomePageController>(builder: (ctrl) {
      final state = ctrl.state;
      final width = MediaQuery.of(context).size.width;
      final height = MediaQuery.of(context).size.height;

      if (state is HomePageLoadSuccess) {
        List<Widget> output = [];
        output.add(const SizedBox(height: 10));
        for (var element in ctrl.list) {
          output.add(
            CardItem(
              data: element,
              onTap: () => ctrl.toDetailProduct(element),
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
            // SizedBox(
            //   height: height * 0.07,
            // ),
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
