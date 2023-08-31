import 'package:flutter/material.dart';
import 'package:assessment_firman/features/home/model/home_transaction_history_response_model.dart';
import '../../../../../components/config/app_style.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CardItem extends StatelessWidget {
  final Teams data;
  final VoidCallback? onTap;

  const CardItem({Key? key, required this.data, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Text(
                  '${data.strTeam}',
                  style:
                      OpenSansFont.style14(textColor: const Color(0xFFBABAC6)),
                ),
                SizedBox(
                  width: 200,
                  height: 200,
                  child: CachedNetworkImage(
                    imageUrl: data.strTeamBadge ?? '',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
