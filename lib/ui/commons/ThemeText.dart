import 'package:flutter/material.dart';
import 'package:intro_energy/ui/commons/IEColors.dart';

abstract class ThemeText {
  static const TextStyle largeText = TextStyle(
      fontFamily: 'Montserrat',
      color: IEColors.AppColorWight,
      fontSize: 30,
      height: 0.5,
      fontWeight: FontWeight.w600);

  static const TextStyle normalText = TextStyle(
      fontFamily: 'Montserrat',
      color: IEColors.AppColorWight,
      fontSize: 20,
      height: 0.5,
      fontWeight: FontWeight.w600);

  static const TextStyle miniText = TextStyle(
    fontFamily: 'Montserrat',
    color: IEColors.AppColorWight,
    fontSize: 12,
    height: 0.5,);

  static const TextStyle normalTextBlack = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black,
      fontSize: 16,
      height: 0.5,
      fontWeight: FontWeight.w600);

  static const TextStyle minGray = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.black54,
      fontSize: 12,
      height: 0.5,
      fontWeight: FontWeight.w600);


  static const TextStyle normalTextWight = TextStyle(
      fontFamily: 'Montserrat',
      color: Colors.white,
      fontSize: 26,
      height: 0.5,
      fontWeight: FontWeight.w600);

}