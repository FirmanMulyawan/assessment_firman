import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../components/config/app_style.dart';

import 'detail_team_controller.dart';

class DetailTeamScreen extends GetView<DetailTeamController> {
  const DetailTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.white,
      appBar: _appBar(),
      body: SingleChildScrollView(
        child: GetBuilder<DetailTeamController>(
          builder: (ctrl) => Builder(builder: (_) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  Text(
                    ctrl.intFormedYear,
                    style: OpenSansFont.style14(
                        textColor: const Color(0xFFBABAC6)),
                  ),
                  Text(ctrl.strStadium),
                  Text(ctrl.strWebsite),
                  Text(ctrl.strFacebook),
                  Text(ctrl.strTwitter),
                  Text(ctrl.strInstagram),
                  Text(ctrl.strDescriptionEN),
                  Text(ctrl.strYoutube),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar() => AppBar(
        title: Text(
          "Ubah Data Profil",
          style: MontserratFont.style16Bold(),
        ),
        leadingWidth: 35,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_outlined,
                color: AppStyle.bluePrimary),
            onPressed: () {},
          ),
        ),
        elevation: 0,
        backgroundColor: AppStyle.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: AppStyle.lightGrey,
              height: 1,
            )),
      );
}
