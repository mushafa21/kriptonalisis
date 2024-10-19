import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dimen.dart';
import 'type.dart';
import 'color.dart';

class AppTheme {
  // Settings Light Theme
  static ThemeData get light {
    return ThemeData(
        fontFamily: "Satoshi",
        useMaterial3: true,
        colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: primaryColor,
            onPrimary: light1Color,
            primaryContainer: primaryColor,
            onPrimaryContainer: light1Color,
            secondary: primaryColor,
            onSecondary: light1Color,
            secondaryContainer: primaryColor,
            onSecondaryContainer: light1Color,
            error: primaryColor,
            onError: light1Color,
            surface: light1Color,
            onSurface: neutral400Color,
            surfaceBright: light2Color,
            onSurfaceVariant: neutral500Color),
        textTheme: TextTheme(
          displayLarge: heading1Bold.copyWith(color: titleColor),
          displayMedium: heading2Bold.copyWith(color: titleColor),
          displaySmall: heading3Bold.copyWith(color: titleColor),
          headlineLarge: largeBold.copyWith(color: titleColor),
          headlineMedium: normalBold.copyWith(color: titleColor),
          headlineSmall: smallBold.copyWith(color: titleColor),
          titleLarge: normalMedium.copyWith(color: titleColor),
          titleMedium: normalMedium.copyWith(color: titleColor),
          titleSmall: xSmallMedium.copyWith(color: titleColor),
          bodyLarge: largeRegular.copyWith(color: titleColor),
          bodyMedium: normalRegular.copyWith(color: titleColor),
          bodySmall: smallRegular.copyWith(color: titleColor),
          labelLarge: normalRegular.copyWith(color: titleColor),
          labelMedium: smallRegular.copyWith(color: titleColor),
          labelSmall: xSmallRegular.copyWith(color: titleColor),
        ),
        checkboxTheme: _checkboxThemeData,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        actionIconTheme: _actionIconThemeDataLight,
        appBarTheme: _appBarThemeLight,
        inputDecorationTheme: _inputDecorationThemeLight,
        outlinedButtonTheme: _outlinedButtonThemeDataLight,
        elevatedButtonTheme: _elevatedButtonThemeData,
        scaffoldBackgroundColor: light1Color,
        textButtonTheme: _textButtonThemeData,
        iconButtonTheme: _iconButtonThemeData,
        chipTheme: _chipThemeData,
        bottomSheetTheme: _bottomSheetThemeData,
        radioTheme: _radioTheme,
        floatingActionButtonTheme: _floatingActionButtonThemeData,
        listTileTheme: _listTileThemeData,
        switchTheme: _switchThemeData
        /*searchBarTheme: _searchBarThemeData,
      searchViewTheme: _searchViewThemeData,*/
        );
  }

  static ThemeData get dark {
    return ThemeData(
        fontFamily: "Satoshi",
        useMaterial3: true,
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: primaryColor,
          onPrimary: dark1Color,
          secondary: primaryColor,
          onSecondary: dark1Color,
          error: primaryColor,
          onError: dark1Color,
          surface: dark1Color,
          onSurface: whiteColor,
        ),
        textTheme: TextTheme(
          displayLarge: heading1Bold.copyWith(color: neutral50Color),
          displayMedium: heading2Bold.copyWith(color: neutral50Color),
          displaySmall: heading3Bold.copyWith(color: neutral50Color),
          headlineLarge: largeBold.copyWith(color: neutral50Color),
          headlineMedium: normalBold.copyWith(color: neutral50Color),
          headlineSmall: smallBold.copyWith(color: neutral50Color),
          titleLarge: normalMedium.copyWith(color: neutral50Color),
          titleMedium: normalMedium.copyWith(color: neutral50Color),
          titleSmall: xSmallMedium.copyWith(color: neutral50Color),
          bodyLarge: largeRegular.copyWith(color: neutral50Color),
          bodyMedium: normalRegular.copyWith(color: neutral50Color),
          bodySmall: smallRegular.copyWith(color: neutral50Color),
          labelLarge: normalRegular.copyWith(color: neutral50Color),
          labelMedium: smallRegular.copyWith(color: neutral50Color),
          labelSmall: xSmallRegular.copyWith(color: neutral50Color),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        actionIconTheme: _actionIconThemeDataDark,
        appBarTheme: _appBarThemeDark,
        inputDecorationTheme: _inputDecorationThemeDark,
        outlinedButtonTheme: _outlinedButtonThemeDataDark,
        elevatedButtonTheme: _elevatedButtonThemeData,
        scaffoldBackgroundColor: dark1Color,
        textButtonTheme: _textButtonThemeData,
        iconButtonTheme: _iconButtonThemeData,
        chipTheme: _chipThemeData,
        bottomSheetTheme: _bottomSheetThemeData,
        radioTheme: _radioTheme,
        floatingActionButtonTheme: _floatingActionButtonThemeData,
        listTileTheme: _listTileThemeData,
        checkboxTheme: _checkboxThemeData,
        switchTheme: _switchThemeData
        /*searchBarTheme: _searchBarThemeData,
      searchViewTheme: _searchViewThemeData,*/
        );
  }

  static final ActionIconThemeData _actionIconThemeDataLight =
      ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: screenPadding),
      child: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: Container(
              width: 28 + spacing3 + spacing3,
              height: 28 + spacing3 + spacing3,
              decoration: BoxDecoration(
                  border: Border.all(color: neutral100Color),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                  child: SvgPicture.asset(
                "assets/images/ic_chevron_left.svg",
                width: 20,
                height: 20,
                color: titleColor,
              )))),
    ),
  );

  static final ActionIconThemeData _actionIconThemeDataDark =
      ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: screenPadding),
      child: IconButton(
          onPressed: () {
            Navigator.maybePop(context);
          },
          icon: Container(
              width: 28 + spacing3 + spacing3,
              height: 28 + spacing3 + spacing3,
              decoration: BoxDecoration(
                  border: Border.all(color: neutral100Color),
                  borderRadius: BorderRadius.circular(16)),
              child: Center(
                  child: SvgPicture.asset(
                "assets/images/ic_chevron_left.svg",
                width: 20,
                height: 20,
                color: whiteColor,
              )))),
    ),
  );

  static AppBarTheme _appBarThemeLight = AppBarTheme(
      backgroundColor: light1Color,
      elevation: 0,
      titleTextStyle: largeBold.copyWith(color: neutral500Color),
      centerTitle: true,
      scrolledUnderElevation: 0);

  static const AppBarTheme _appBarThemeDark = AppBarTheme(
      titleSpacing: screenPadding,
      backgroundColor: dark1Color,
      elevation: 0,
      titleTextStyle: largeBold,
      centerTitle: true,
      scrolledUnderElevation: 0);

  static SwitchThemeData _switchThemeData = SwitchThemeData(
      trackOutlineColor: MaterialStateProperty.resolveWith(
        (final Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return neutral100Color;
        },
      ),
      trackColor: MaterialStateProperty.resolveWith(
        (final Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return primaryColor;
          }
          return neutral100Color;
        },
      ),
      thumbColor: MaterialStatePropertyAll(whiteColor));

  static const RadioThemeData _radioTheme = RadioThemeData(
    fillColor: MaterialStatePropertyAll<Color>(primaryColor),
  );

  static final InputDecorationTheme _inputDecorationThemeLight =
      InputDecorationTheme(
          errorStyle: smallRegular.copyWith(color: errorColor),
          hintStyle: smallRegular,
          labelStyle: xSmallRegular.copyWith(color: neutral500Color),
          counterStyle: xSmallMedium.copyWith(color: descriptionColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: spacing6,
            vertical: spacing4,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(
                color: neutral200Color,
              )),
          focusColor: primarySurfaceColor,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(color: neutral200Color)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(color: primaryColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(color: errorColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(color: errorColor)));

  static final InputDecorationTheme _inputDecorationThemeDark =
      InputDecorationTheme(
          errorStyle: smallRegular.copyWith(color: errorColor),
          hintStyle: smallRegular.copyWith(color: neutral50Color),
          labelStyle: xSmallRegular.copyWith(color: Colors.white),
          counterStyle: xSmallMedium.copyWith(color: neutral50Color),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: spacing6,
            vertical: spacing4,
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(
                color: neutral200Color,
              )),
          focusColor: primarySurfaceColor,
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(color: neutral200Color)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(color: primaryColor)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(color: errorColor)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radiusM),
              borderSide: const BorderSide(color: errorColor)));

  static final ListTileThemeData _listTileThemeData = ListTileThemeData(
    // tileColor: light1Color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusS)),
    titleTextStyle: smallBold,
    textColor: titleColor,
  );

  static final OutlinedButtonThemeData _outlinedButtonThemeDataLight =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
    foregroundColor: titleColor,
    textStyle: largeBold,
    padding:
        const EdgeInsets.symmetric(horizontal: spacing4, vertical: spacing4),
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXxl)),
    side: const BorderSide(
      color: neutral100Color,
    ),
    disabledForegroundColor: neutral100Color,
  ));

  static final OutlinedButtonThemeData _outlinedButtonThemeDataDark =
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
    foregroundColor: neutral50Color,
    textStyle: largeBold,
    padding:
        const EdgeInsets.symmetric(horizontal: spacing4, vertical: spacing4),
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXxl)),
    side: const BorderSide(
      color: neutral100Color,
    ),
    disabledForegroundColor: neutral100Color,
  ));

  static final ElevatedButtonThemeData _elevatedButtonThemeData =
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
    shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXxl)),
    padding:
        const EdgeInsets.symmetric(horizontal: spacing5, vertical: spacing4),
    foregroundColor: whiteColor,
    backgroundColor: primaryColor,
    disabledForegroundColor: whiteColor,
    disabledBackgroundColor: backgroundDisable,
    textStyle: normalBold,
  ));

  static final ChipThemeData _chipThemeData = ChipThemeData(
      backgroundColor: neutral100Color,
      shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXl)),
      side: const BorderSide(color: neutral100Color, width: 1));

  static final TextButtonThemeData _textButtonThemeData = TextButtonThemeData(
      style: TextButton.styleFrom(
    textStyle: smallBold,
    foregroundColor: accent500Color,
    minimumSize: Size.zero,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ));

  static final IconButtonThemeData _iconButtonThemeData = IconButtonThemeData(
      style: IconButton.styleFrom(
    minimumSize: Size.zero,
    padding: EdgeInsets.zero,
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  ));

  static const BottomSheetThemeData _bottomSheetThemeData =
      BottomSheetThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(radiusLg),
      topRight: Radius.circular(radiusLg),
    )),
  );

  static const FloatingActionButtonThemeData _floatingActionButtonThemeData =
      FloatingActionButtonThemeData(
    backgroundColor: primaryColor,
  );

  static final CheckboxThemeData _checkboxThemeData =
      CheckboxThemeData(side: BorderSide(color: neutral100Color, width: 2));
}
