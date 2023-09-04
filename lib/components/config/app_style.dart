import 'package:flutter/material.dart';

class AppStyle {
  // 0xFF
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF005EB8);
  static const Color blue02 = Color(0xFF00A8E2);
  static const Color bluePrimary = Color(0xFF001C88);
  static const Color blueDisable = Color(0xFF7F8DC3);
  static const Color lightGrey = Color(0xFFC6D5DB);
  static const Color lightGrey02 = Color(0xFFA3A8BA);
  static const Color lightGrey03 = Color(0xFFF0F5F7);
  static const Color lightGrey02Disable = Color(0xFFF5F6FA);
  static const Color red500 = Color(0xFFE62129);
  static const Color red = Color(0xFFCE2828);
  static const Color red400 = Color(0xFFEF4D4D);
  static const Color redError = Color(0xFFEF413B);
  static const Color yellow500 = Color(0xFFFFF000);
  static const Color grey300 = Color(0xFFE0E0E0);
  static const Color grey100 = Color(0xFFF5F5F5);
  static const Color gray1000 = Color(0xFF979797);
  static const Color gray900 = Color(0xFF999999);
  static const Color gray700 = Color(0xffE0DFDC);
  static const Color gray800 = Color(0xFF9F9F9F);
  static const Color grayMain = Color(0xFF747B97);
  static const Color blackCustom = Color(0xFF4D4F5C);
  static const Color black = Color(0xFF262626);
  static const Color black02 = Color(0xFF333333);
  static const Color lightShadow = Color.fromRGBO(163, 168, 186, 0.3);

  // orange
  static const Color orange = Color(0xFFFF6600);
  static const Color orange900 = Color(0xFFF9E9D9);
  static const Color secondaryGreen = Color(0xFF00A990);

  static const MaterialColor appTheme =
      MaterialColor(_appthemePrimaryValue, <int, Color>{
    50: Color(0xFFc7a8c7),
    100: Color(0xFFBF9BBF),
    200: Color(0xFFBF9BBF),
    300: Color(0xFFBF9BBF),
    400: Color(0xFFA776A7),
    500: Color(_appthemePrimaryValue),
    600: Color(0xFF955f95),
    700: Color(0xFF895889),
    800: Color(0xFF7c507c),
    900: Color(0xFF704870),
  });
  static const int _appthemePrimaryValue = 0xFFA776A7;

  // static const MaterialColor appthemeAccent =
  //     MaterialColor(_appThemeAccentValue, <int, Color>{
  //   100: Color(0xFFFFFFFF),
  //   200: Color(_appThemeAccentValue),
  //   400: Color(0xFFFF9A9B),
  //   700: Color(0xFFFF8082),
  // });
  // static const int _appThemeAccentValue = 0xFFFFCDCD;

  static BorderRadius borderRadiusVerySmall() => BorderRadius.circular(4.0);
  static BorderRadius borderRadiusSmall() => BorderRadius.circular(10.0);
  static BorderRadius borderRadiusMedium() => BorderRadius.circular(20.0);

  static InputDecoration textInputDecorator(
          {String? hintText,
          Widget? prefixIcon,
          Widget? iconSuffix,
          Color? enableBorderColor,
          Color? focusBorderColor,
          String? errorText,
          int? errorMaxLines,
          bool isEnable = true}) =>
      InputDecoration(
        filled: true,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: focusBorderColor ?? Colors.grey, width: 1.1),
          borderRadius: borderRadiusSmall(),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: enableBorderColor ?? Colors.grey.shade200, width: 1.1),
          borderRadius: borderRadiusSmall(),
        ),
        hintText: hintText,
        hintStyle: OpenSansFont.style14(textColor: AppStyle.lightGrey02),
        errorText: errorText,
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppStyle.red500, width: 1.1),
          borderRadius: borderRadiusSmall(),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppStyle.red500, width: 1.1),
          borderRadius: borderRadiusSmall(),
        ),
        errorMaxLines: errorMaxLines,
        errorStyle: OpenSansFont.style14(textColor: AppStyle.red),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        prefixIcon: prefixIcon != null
            ? Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(14),
                child: prefixIcon,
              )
            : null,
        suffixIcon: iconSuffix != null
            ? Container(
                height: 40,
                width: 40,
                padding: const EdgeInsets.all(14),
                child: iconSuffix,
              )
            : null,
        fillColor: isEnable ? Colors.white : Colors.grey.shade400,
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade200, width: 1.1),
          borderRadius: borderRadiusSmall(),
        ),
      );
}

class MontserratFont {
  static TextStyle style12({Color textColor = Colors.black}) {
    return TextStyle(fontSize: 12, color: textColor, fontFamily: 'Montserrat');
  }

  static TextStyle style12SemiBold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'Montserrat');
  }

  static TextStyle style14({Color textColor = Colors.black}) {
    return TextStyle(fontSize: 14, color: textColor, fontFamily: 'Montserrat');
  }

  static TextStyle style15({Color textColor = Colors.black}) {
    return TextStyle(fontSize: 15, color: textColor, fontFamily: 'Montserrat');
  }

  static TextStyle style15Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 15,
        color: textColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat');
  }

  static TextStyle style16Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat');
  }

  static TextStyle style18Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'Montserrat');
  }
}

class OpenSansFont {
  static TextStyle style12({Color textColor = Colors.black}) {
    return TextStyle(fontSize: 12, color: textColor, fontFamily: 'OpenSans');
  }

  static TextStyle style12SemiBold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontFamily: 'OpenSans');
  }

  static TextStyle style14({Color textColor = Colors.black}) {
    return TextStyle(fontSize: 14, color: textColor, fontFamily: 'OpenSans');
  }

  static TextStyle style16Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'OpenSans');
  }

  static TextStyle style18Bold({Color textColor = Colors.black}) {
    return TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w700,
        fontFamily: 'OpenSans');
  }
}
