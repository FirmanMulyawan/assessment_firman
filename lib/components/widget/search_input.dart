import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../config/app_style.dart';
import '../config/app_const.dart';

class WidgetSearchInput extends StatelessWidget {
  final String hintText;
  final TextInputType keyboardType;
  final bool? readOnly;
  final VoidCallback? onTap;
  final TextInputAction textInputAction;
  final TextEditingController? controller;
  final bool? enableInteractiveSelection;
  final String? initialValue;
  final bool obscureText;
  final Function(String)? onFieldSubmitted;
  final Function(String)? onChanged;
  final String? errorText;
  final Color? errorBorderColor;
  final int? errorMaxLines;

  const WidgetSearchInput(
      {Key? key,
      required this.keyboardType,
      required this.textInputAction,
      required this.hintText,
      this.controller,
      this.readOnly = false,
      this.onTap,
      this.obscureText = false,
      this.errorMaxLines,
      this.onFieldSubmitted,
      this.errorText,
      this.onChanged,
      this.enableInteractiveSelection = false,
      this.errorBorderColor,
      this.initialValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppStyle.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: const [
          BoxShadow(
            color: AppStyle.lightShadow,
            spreadRadius: 0.1,
            blurRadius: 3,
            offset: Offset(0, 2.0),
          ),
          BoxShadow(
            color: AppStyle.lightShadow,
            spreadRadius: 0.1,
            blurRadius: 3,
            offset: Offset(2.0, 2.0),
          ),
        ],
      ),
      child: TextFormField(
        initialValue: initialValue,
        enableInteractiveSelection: enableInteractiveSelection,
        onTap: onTap,
        readOnly: readOnly ?? false,
        cursorColor: AppStyle.bluePrimary,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        style: OpenSansFont.style14(textColor: AppStyle.lightGrey02),
        textAlignVertical: TextAlignVertical.center,
        autocorrect: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        // validator: (value) {},
        onFieldSubmitted: onFieldSubmitted,
        decoration: AppStyle.textInputDecorator(
          // isEnable:
          // iconSuffix:
          errorBorderColor: errorBorderColor,
          errorText: errorText,
          errorMaxLines: errorMaxLines,
          enableBorderColor: AppStyle.lightGrey,
          focusBorderColor: AppStyle.bluePrimary,
          hintText: hintText,
          prefixIcon: SvgPicture.asset(
            AppConst.assetIonicIosSearch,
          ),
        ),
        textInputAction: textInputAction,
      ),
    );
  }
}
