import 'package:flutter/material.dart';

BoxDecoration homePageCardBoxDecoration({double borderRadius = 24}) {
  return BoxDecoration(
    borderRadius: BorderRadius.circular(borderRadius),
    border: Border.all(color: AppColors.borderColor),
    color: AppColors.backgroundWhite,
  );
} 

final avaTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor: AppColors.avaPrimary),
  useMaterial3: true,
  inputDecorationTheme: _inputDecorationTheme,
  dividerColor: AppColors.borderColor,
  dropdownMenuTheme: DropdownMenuThemeData(
    inputDecorationTheme: _inputDecorationTheme,
    textStyle: const TextStyle(
      color: AppColors.textPrimaryDark,
      fontSize: 14,
      fontWeight: FontWeight.w400,
    ),
    menuStyle: MenuStyle(
      backgroundColor: WidgetStateProperty.all(AppColors.backgroundWhite),
    ),
  ),
  menuButtonTheme: MenuButtonThemeData(
    style: MenuItemButton.styleFrom(
      backgroundColor: AppColors.backgroundWhite,
      textStyle: const TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 44),
      backgroundColor: AppColors.avaPrimary,
      foregroundColor: AppColors.textWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      minimumSize: const Size(double.infinity, 44),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      minimumSize: const Size(double.infinity, 44),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      backgroundColor: AppColors.avaPrimary,
      elevation: 0,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    ),
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.avaPrimary;
      }
      return AppColors.borderColor;
    }),
  ),
);

abstract class AppColors {
  static const Color avaDark = Color(0xff2a1e39);
  static const Color avaPrimary = Color(0xff420085);
  static const Color avaSecondary = Color(0xff48a388);
  static const Color avaSecondaryLight = Color(0xffa9eace);
  static const Color backgroundWhite = Color(0xffffffff);
  static const Color borderColor = Color(0x26000000);
  static const Color disabled = Color(0xffd8d5d9);
  static const Color fullBlack = Color(0xff000000);
  static const Color lightPurple = Color(0xffa448ff);
  static const Color manilla = Color(0xfff2f0ed);
  // Good/Medium/Bad colors:
  static const Color okayOrange = Color(0xffff7e17);
  static const Color okayOrangeLight = Color(0xffFFD8B9);
  static const Color badRed = Color(0xffdd1338);
  static const Color badRedLight = Color(0xffF5B8C3);


  // Text colors:
  static const Color textGreen = Color(0xff003928);
  static const Color textLight = Color(0xff736b7c);
  static const Color textPrimaryDark = Color(0xff2a1e39);
  static const Color textWhite = Color(0xffffffff);
}

const _inputDecorationTheme = InputDecorationTheme(
  filled: true,
  fillColor: AppColors.backgroundWhite,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.borderColor),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide(color: AppColors.borderColor),
    borderRadius: BorderRadius.all(Radius.circular(12)),
  ),
  labelStyle: TextStyle(
    color: AppColors.textPrimaryDark,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  helperStyle: TextStyle(
    color: AppColors.textPrimaryDark,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
  hintStyle: TextStyle(
    color: AppColors.textPrimaryDark,
    fontSize: 16,
    fontWeight: FontWeight.w400,
  ),
);
