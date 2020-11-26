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
}

