import 'package:country_picker_plus/country_picker_plus.dart';
import 'package:flutter/material.dart';

const Color kPrimaryColor = Colors.blue;
const kTextColor = Color(0xFF757575);

// les couleurs du stepper
Color completeColor = kPrimaryColor;
Color  inProgressColor =Color(0xff5e6172);
Color  todoColor = Color(0xffd1d2d7);

const kCreateProfileTextsList = [
  ["Créer un compte", "Veuillez renseigner vos informations de compte"],
  ["Vérification OTP", "Saisissez le code OTP que nous vous avons envoyé par email"],
  ["Localisation", "Ces informations nous aiderons a mieux vous connaitre pour vous offrire les meilleurs services"],
  ["Profile", "Veuillez fournir des informations complémentaires sur vous"],
  ["Quel est votre sexe", ""],
];

class GenderType {
  static String man = "man";
  static String women = "women";
}
const kMobileDefaultHeight = 812.0; // hauteur par default pour le mobile
const kMobileDefaultWidth = 375.0; // largeur par default pour le mobile

const kDesktopDefaultHeight = 1024.0; // hauteur par default pour le desktop
const kDesktopDefaultWidth = 1440.0; // largeur par default pour le desktop

const kTabletDefaultHeight = 918.0; // hauteur par default pour le tablet
const kTabletDefaultWidth = 907.5; // largeur par default pour le tablet

ButtonStyle? kStyleNextBtn = ButtonStyle(
  minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
  elevation: MaterialStateProperty.all(0),
  overlayColor: MaterialStateProperty.all(Colors.transparent),
  backgroundColor: MaterialStateProperty.all(kPrimaryColor),
  shape: MaterialStateProperty.all(
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(kInputBorderRadius))
  ),
  side: MaterialStateProperty.all(
    const BorderSide(color: Colors.transparent, width: kBorderSideWidth),
  ),
);

const kTextFieldLabelStyle = TextStyle(color: Colors.black);

// Decoration correspondant à chaque cellule du formulaire OTP
final otpFieldDecoration = InputDecoration(
  border: const OutlineInputBorder(borderSide: BorderSide(color: kTextColor, width: kBorderSideWidth)),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kTextColor, width: kBorderSideWidth),
    borderRadius: BorderRadius.circular(kInputBorderRadius),
  ),
  contentPadding: EdgeInsets.symmetric(vertical: 25),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(kInputBorderRadius),
      borderSide: const BorderSide(color: kTextColor, width: kBorderSideWidth)
  ),
);

const kDefaultPadding = 20.0;
const kDefaultPaddingLogUpPage = 50.0;
const kDefaultOTPPadding = 8.0;
const kDefaultOTPFieldWidth = 70.0;
const kInputBorderRadius = 5.0;
const kBorderSideWidth = 2.0;


var fieldDecoration = CPPFDecoration(
  labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
  hintStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
  margin: const EdgeInsets.all(10),
  suffixColor: kPrimaryColor,
  innerColor: Colors.white,
  filled: true,
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: const BorderSide(color: kPrimaryColor),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: const BorderSide(color: kPrimaryColor),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: BorderSide(color: kPrimaryColor),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: BorderSide(color: kPrimaryColor),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: BorderSide(color: kPrimaryColor),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(kInputBorderRadius),
    borderSide: BorderSide(color: kPrimaryColor),
  ),
);
final bottomSheetDecoration = CPPBSHDecoration(
  closeColor: kPrimaryColor,
  itemDecoration: BoxDecoration(
    color: Colors.grey.withOpacity(0.03),
    //color: Colors.white,
    borderRadius: BorderRadius.circular(kInputBorderRadius),
  ),
  itemsPadding: const EdgeInsets.all(8),
  itemsSpace: const EdgeInsets.symmetric(vertical: 4),
  itemTextStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ),
  shape: RoundedRectangleBorder(
    side: BorderSide(color: Colors.grey.withOpacity(0.1)),
    borderRadius: const BorderRadius.all(Radius.circular(kInputBorderRadius)),
  ),
);
final searchDecoration = CPPSFDecoration(
  height: 45,
  padding: const EdgeInsets.symmetric(
    vertical: 2,
    horizontal: 10,
  ),
  filled: true,
  margin: const EdgeInsets.symmetric(vertical: 8),
  hintStyle: const TextStyle(
    color: kTextColor,
    fontWeight: FontWeight.w400,
  ),
  searchIconColor: kPrimaryColor,
  textStyle: const TextStyle(color: Colors.black, fontSize: 12),
  innerColor: Colors.white,
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: kPrimaryColor),
    borderRadius: BorderRadius.circular(kInputBorderRadius),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: kPrimaryColor),
    borderRadius: BorderRadius.circular(kInputBorderRadius),
  ),
);