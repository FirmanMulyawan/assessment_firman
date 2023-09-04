import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_style.dart';

class CardItem extends StatelessWidget {
  final VoidCallback? onTap;
  final VoidCallback? handleRight;
  final String? assetItem;
  final String? strTeam;
  final String? strTeamBadge;
  final bool? isMargin;

  const CardItem(
      {Key? key,
      this.onTap,
      this.handleRight,
      this.assetItem,
      this.strTeam,
      this.isMargin = false,
      this.strTeamBadge})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyle.appTheme,
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: isMargin == true
                    ? const EdgeInsets.only(
                        top: 10, left: 5, right: 5, bottom: 5)
                    : const EdgeInsets.only(
                        top: 5, left: 5, right: 5, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: isMargin == true
                      ? const EdgeInsets.only(
                          top: 10, left: 5, right: 5, bottom: 5)
                      : const EdgeInsets.only(
                          top: 5, left: 5, right: 5, bottom: 10),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: AppStyle.appTheme.shade200,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: InkWell(
                      onTap: onTap,
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: 100,
                            child: Text(
                              strTeam ?? '',
                              textAlign: TextAlign.center,
                              style: MontserratFont.style15Bold(
                                  textColor: AppStyle.white),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              height: 80,
                              child: CachedNetworkImage(
                                imageUrl: strTeamBadge ?? '',
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              color: AppStyle.orange900,
              width: 50,
              child: InkWell(
                onTap: handleRight,
                child: SvgPicture.asset(
                  assetItem ?? '',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
