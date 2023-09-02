import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:readmore/readmore.dart';
import '../../../components/config/app_style.dart';
import '../../../components/config/app_const.dart';

import 'detail_team_controller.dart';
import './widget_detail_team/card_logo_item.dart';

class DetailTeamScreen extends GetView<DetailTeamController> {
  const DetailTeamScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
                centerTitle: true,
                pinned: true,
                floating: true,
                snap: true,
                expandedHeight: 160,
                elevation: 10,
                flexibleSpace: GetBuilder<DetailTeamController>(builder: (ctx) {
                  return FlexibleSpaceBar(
                      background: CachedNetworkImage(
                        imageUrl: ctx.strTeamBadge,
                        fit: BoxFit.contain,
                      ),
                      centerTitle: true,
                      title: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: AppStyle.white,
                            borderRadius: BorderRadius.circular(4.0)),
                        child: Text(
                          ctx.strTeam,
                          style: MontserratFont.style18Bold(
                              textColor: AppStyle.black),
                        ),
                      ));
                })),
            SliverToBoxAdapter(
              //   child: GetBuilder<DetailTeamController>(
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
                        ReadMoreText(ctrl.strDescriptionEN,
                            trimLines: 8,
                            style: OpenSansFont.style14(
                                textColor: AppStyle.appTheme.shade900),
                            lessStyle: OpenSansFont.style16Bold(
                                textColor: AppStyle.appTheme.shade900),
                            trimMode: TrimMode.Line,
                            trimCollapsedText: 'Show more',
                            trimExpandedText: 'Show less',
                            moreStyle: OpenSansFont.style16Bold(
                                textColor: AppStyle.appTheme.shade900)),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Formed Year',
                                    style: OpenSansFont.style16Bold(
                                        textColor: AppStyle.appTheme.shade900)),
                                Text('Stadium',
                                    style: OpenSansFont.style16Bold(
                                        textColor: AppStyle.appTheme.shade900)),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  ctrl.intFormedYear,
                                  style: OpenSansFont.style16Bold(
                                      textColor: AppStyle.blue),
                                ),
                                Text(
                                  ctrl.strStadium,
                                  style: OpenSansFont.style16Bold(
                                      textColor: AppStyle.blue),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (ctx, index) {
                    return GetBuilder<DetailTeamController>(builder: (ctrl) {
                      return WidgetCardLogoItem(
                        onTap: () => ctrl.handleLinkUrl(
                            AppConst.dataImageSocialMedia[index].linkUrl),
                        buttonName:
                            AppConst.dataImageSocialMedia[index].linkUrl ?? '',
                        nameAsset:
                            AppConst.dataImageSocialMedia[index].image ?? '',
                      );
                    });
                  },
                  childCount: 5,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20))
          ],
        ),
      ),
    );
  }
}
