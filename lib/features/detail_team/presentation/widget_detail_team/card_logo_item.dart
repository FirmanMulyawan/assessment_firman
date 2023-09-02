import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../components/config/app_style.dart';

class WidgetCardLogoItem extends StatelessWidget {
  final VoidCallback onTap;
  final String nameAsset;
  final String buttonName;

  const WidgetCardLogoItem({
    Key? key,
    required this.onTap,
    required this.nameAsset,
    required this.buttonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return InkWell(
        splashFactory: NoSplash.splashFactory,
        onTap: onTap,
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              nameAsset,
              width: constraints.maxWidth * .5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(buttonName,
                textAlign: TextAlign.center,
                style: OpenSansFont.style14(textColor: AppStyle.blue)),
          ),
        ]),
      );
    });
  }
}
