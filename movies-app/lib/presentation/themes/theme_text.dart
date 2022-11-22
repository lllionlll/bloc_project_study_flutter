import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/common/constants/app_sizes.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';

class ThemeText {
  ThemeText._();

  static TextTheme get _popinsTextStyle => GoogleFonts.poppinsTextTheme();

//////////////////////////////////////// Whites ///////////////////////////////////////////////
  static TextStyle get _whiteHeadline6 => _popinsTextStyle.headline6!.copyWith(
        color: Colors.white,
        fontSize: AppSizes.size_20,
      );
  static TextStyle get _whiteHeadline5 =>
      _popinsTextStyle.headline5!.copyWith(color: Colors.white);

  static TextStyle get _whiteSubtitle1 => _popinsTextStyle.subtitle1!.copyWith(
        color: Colors.white,
        fontSize: AppSizes.size_16,
      );

  static TextStyle get _whiteBodyText2 => _popinsTextStyle.bodyText2!.copyWith(
        color: Colors.white,
        fontSize: AppSizes.size_14,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get _whiteButton => _popinsTextStyle.button!
      .copyWith(color: Colors.white, fontSize: AppSizes.size_14);

///////////////////////////////////// Vulacans //////////////////////////////////////////////////

  static TextStyle get _vulcanHeadline6 => _popinsTextStyle.headline6!.copyWith(
        color: Appcolors.vulcan,
        fontSize: AppSizes.size_20,
      );
  static TextStyle get _vulcanHeadline5 =>
      _popinsTextStyle.headline5!.copyWith(color: Appcolors.vulcan);

  static TextStyle get _vulcanSubtitle1 => _popinsTextStyle.subtitle1!.copyWith(
        color: Appcolors.vulcan,
        fontSize: AppSizes.size_16,
      );

  static TextStyle get _vulcanBodyText2 => _popinsTextStyle.bodyText2!.copyWith(
        color: Appcolors.vulcan,
        fontSize: AppSizes.size_14,
        wordSpacing: 0.25,
        letterSpacing: 0.25,
        height: 1.5,
      );

  static TextStyle get _vulcanButton => _popinsTextStyle.button!
      .copyWith(color: Appcolors.vulcan, fontSize: AppSizes.size_14);

///////////////////////////////////// TextThemes //////////////////////////////////////////////////
  static getLightTextTheme() => TextTheme(
        headline6: _vulcanHeadline6,
        headline5: _vulcanHeadline5,
        subtitle1: _vulcanSubtitle1,
        bodyText2: _vulcanBodyText2,
        button: _vulcanButton,
      );

  static getDarkTextTheme() => TextTheme(
        headline6: _whiteHeadline6,
        headline5: _whiteHeadline5,
        subtitle1: _whiteSubtitle1,
        bodyText2: _whiteBodyText2,
        button: _whiteButton,
      );
}

extension TextThemeExtension on TextTheme {
  TextStyle get royalBlueSubtitle1 => ThemeText._whiteSubtitle1.copyWith(
        color: Appcolors.royalBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle get greySubtitle1 =>
      ThemeText._whiteSubtitle1.copyWith(color: Appcolors.grey);

  TextStyle get violetHeadline6 =>
      this.headline6!.copyWith(color: Appcolors.violet);
  TextStyle get vulcanBodyText2 => this.bodyText2!.copyWith(
        color: Appcolors.vulcan,
        fontWeight: FontWeight.w600,
      );
  TextStyle get greyCaption => this.caption!.copyWith(color: Colors.grey);
}
