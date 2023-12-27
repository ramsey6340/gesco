import 'package:flutter/material.dart';
import 'package:gesco/constantes.dart';

// Obtenez la hauteur proportionnelle selon la taille de l'écran d'un desktop
double getProportionateScreenHeight(
    MediaQueryData mediaQueryData, double inputHeight) {
  double screenHeight = mediaQueryData.size.height;
  double defaultHeight = (mediaQueryData.size.height <= kMobileDefaultHeight)
      ? kMobileDefaultHeight
      : (mediaQueryData.size.height > kMobileDefaultHeight &&
      mediaQueryData.size.height <= kTabletDefaultHeight)
      ? kTabletDefaultHeight
      : kDesktopDefaultHeight;
  return (inputHeight / defaultHeight) * screenHeight;
}

// Obtenez la largeur proportionnelle selon la taille de l'écran d'un desktop
double getProportionateScreenWidth(
    MediaQueryData mediaQueryData, double inputWidth) {
  double screenWidth = mediaQueryData.size.width;
  double defaultWidth = (mediaQueryData.size.width <= kMobileDefaultWidth)
      ? kMobileDefaultWidth
      : (mediaQueryData.size.width > kMobileDefaultWidth &&
              mediaQueryData.size.width <= kTabletDefaultWidth)
          ? kTabletDefaultWidth
          : kDesktopDefaultWidth;
  return (inputWidth / defaultWidth) * screenWidth;
}
