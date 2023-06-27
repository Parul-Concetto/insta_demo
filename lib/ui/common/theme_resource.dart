import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../di/shared_preference_service.dart';
import '../../enum/font_type.dart';
import '../../enum/theme_type.dart';
import 'colors_assets.dart';
import 'widgets/change_theme.dart';

class ThemeResource {
  static var fontType = getFontFamilyType(FontFamilyType.openSans);

  static var openSansFont = getFontFamilyType(FontFamilyType.openSans);

  ThemeMode? themeMode;

  SharedPreferenceService sharedPreference = SharedPreferenceService();

  //DarkTheme
  //TODO: change your dark theme according to your Ui
  final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: DarkThemeColors.backgroundColor,
    brightness: Brightness.dark,
    primaryColor: DarkThemeColors.primaryColor,
    secondaryHeaderColor: DarkThemeColors.secondaryColor,
    dividerColor: DarkThemeColors.dividerColor,
    fontFamily: fontType,
    // border color
    buttonTheme: ButtonThemeData(
      buttonColor: DarkThemeColors.primaryColor,
      disabledColor: DarkThemeColors.textDisabled,
      focusColor: DarkThemeColors.secondaryColor,
    ),
    textTheme: TextTheme(
      labelLarge: TextStyle(
        fontSize: 98.0,
        fontWeight: FontWeight.bold, //BOLD
        color: DarkThemeColors.textPrimary,
      ),
      labelMedium: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w500, //MEDIUM
        color: DarkThemeColors.textPrimary,
      ),
      labelSmall: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.normal, //NORMAL
        color: DarkThemeColors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.w600, //SEMI BOLD
        color: DarkThemeColors.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.w500, //BOLD
        color: DarkThemeColors.textPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 40.0,
        fontWeight: FontWeight.normal, //NORMAL
        color: DarkThemeColors.textPrimary,
      ),
    ), colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: DarkThemeColors.primaryColor,
      onSecondary: DarkThemeColors.secondaryColor.withOpacity(0.80),
      onError: DarkThemeColors.errorColor.withOpacity(0.80),
      onPrimary: DarkThemeColors.primaryColor.withOpacity(0.80),
      background: DarkThemeColors.backgroundColor,
      surface: DarkThemeColors.backgroundColor,
      secondary: DarkThemeColors.secondaryColor,
      error: DarkThemeColors.errorColor,
      onBackground: DarkThemeColors.backgroundColor.withOpacity(0.80),
      onSurface: DarkThemeColors.backgroundColor.withOpacity(0.80),
      primaryContainer: DarkThemeColors.textPrimary,
      secondaryContainer: DarkThemeColors.textSecondary,
      onTertiaryContainer: DarkThemeColors.primaryColor,
      outline: DarkThemeColors.dividerColor,
    ).copyWith(background: DarkThemeColors.textBoxColor),
  );

  //Light Theme
  //TODO: change your light theme according to your Ui
  final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: LightThemeColors.backgroundColor,
    brightness: Brightness.light,
    primaryColor: LightThemeColors.primaryColor,
    secondaryHeaderColor: LightThemeColors.secondaryColor,
    dividerColor: LightThemeColors.dividerColor,
    fontFamily: fontType,
    // border color
    buttonTheme: ButtonThemeData(
        buttonColor: LightThemeColors.primaryColor,
        disabledColor: LightThemeColors.textDisabled,
        focusColor: LightThemeColors.secondaryColor),
    textTheme: TextTheme(
        labelLarge: TextStyle(
            fontSize: 98.0,
            fontWeight: FontWeight.bold, //BOLD
            color: LightThemeColors.textPrimary),
        labelMedium: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w500, //MEDIUM
            color: LightThemeColors.textPrimary),
        labelSmall: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.normal, //NORMAL
            color: LightThemeColors.textPrimary),
        bodyMedium: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w600, //SEMI BOLD
            color: LightThemeColors.textPrimary),
        bodyLarge: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.w500, //BOLD
            color: LightThemeColors.textPrimary),
        titleSmall: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.normal, //NORMAL
            color: LightThemeColors.textPrimary)), colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: LightThemeColors.primaryColor,
      onSecondary: LightThemeColors.secondaryColor.withOpacity(0.80),
      onError: LightThemeColors.errorColor.withOpacity(0.80),
      onPrimary: LightThemeColors.primaryColor.withOpacity(0.80),
      background: LightThemeColors.backgroundColor,
      surface: LightThemeColors.backgroundColor,
      secondary: LightThemeColors.secondaryColor,
      error: LightThemeColors.errorColor,
      onBackground: LightThemeColors.backgroundColor.withOpacity(0.80),
      onSurface: LightThemeColors.backgroundColor.withOpacity(0.80),
      primaryContainer: LightThemeColors.textPrimary,
      secondaryContainer: LightThemeColors.textSecondary,
      onTertiaryContainer: LightThemeColors.textDisabled,
      outline: LightThemeColors.dividerColor,
    ).copyWith(background: LightThemeColors.textBoxColor),
  );

  /// Get Current selected Theme
  /// Get Current Selected Theme From Shared Preference
  /// return Object of Theme Mode
  Future<ThemeMode> getSelectedThemeMode() async {
    await sharedPreference.init();
    ThemeMode themeMode = await sharedPreference.getThemeMode();
    ThemeResource().changeThemeMode(themeMode);
    debugPrint(
        'Current Theme: ${ThemeResource().themeMode.toString().toLowerCase()}');
    return themeMode;
  }

  /// Change the Theme Selected by User
  ///  theme : Theme Mode [ex : Theme.dark, Theme.light, Theme.system]
  changeThemeMode(ThemeMode theme) async {
    debugPrint('Change Theme : $theme');
    themeMode = theme;
    await sharedPreference.init();
    await sharedPreference.setThemeMode(theme);
    Get.changeThemeMode(theme);
    // debugPrint('Current Theme : ${themeMode.value}');
  }

  /// Change Theme Common Icon
  /// return Widget
  Widget themeSelectionIcon(BuildContext context,
      {IconData? icon, Color? color}) {
    return InkWell(
      onTap: () => openBottomSheet(context),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Icon(
          icon ?? Icons.more_vert,
          color: color ?? Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
    );
  }

  /// Open Bottom sheet
  /// Show Change Theme Bottom Sheet
  ///
  void openBottomSheet(BuildContext context) {
    getCurrentThemeMode().then((value) {
      Get.bottomSheet(
        SizedBox(
          height: 200.0,
          child: ChangeTheme(themeMode: value),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        ),
      );
    });
  }

  /// Get Current Selected Theme
  /// return Current Theme Mode
  Future<String> getCurrentThemeMode() async {
    debugPrint('Theme Mode : $themeMode');
    var currentTheme = await getSelectedThemeMode();
    if (currentTheme == ThemeMode.dark) {
      return EThemeType.dark.themeName;
    } else if (currentTheme == ThemeMode.light) {
      return EThemeType.light.themeName;
    } else {
      return EThemeType.system.themeName;
    }
  }
}
