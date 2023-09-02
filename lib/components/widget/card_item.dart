import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_style.dart';
import '../../features/home/model/home_response_model.dart';

class CardItem extends StatelessWidget {
  final Teams data;
  final VoidCallback? onTap;
  final VoidCallback? onTapfavorite;
  final String? assetItem;
  const CardItem(
      {Key? key,
      required this.data,
      this.onTap,
      this.onTapfavorite,
      this.assetItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.amber,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: onTap,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          '${data.strTeam}',
                          textAlign: TextAlign.center,
                          style: MontserratFont.style15Bold(
                              textColor: AppStyle.black),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 100,
                          child: CachedNetworkImage(
                            imageUrl: data.strTeamBadge ?? '',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 50,
                child: InkWell(
                  onTap: onTapfavorite,
                  child: SvgPicture.asset(
                    assetItem ?? '',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
