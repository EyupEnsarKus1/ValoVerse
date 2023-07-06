import 'package:flutter/material.dart';
import 'package:valorant_wiki_app/ui/constants/styles/fonts.dart';

TextStyle headlineSmallTextStyle({bool isBold = false}) {
  return TextStyle(
    fontFamily: AppFonts.valorant,
    fontSize: AppSizes.headlineSmall,
    fontWeight: isBold ? AppWeights.bold : AppWeights.normal,
  );
}

TextStyle bodySmallTextStyle({bool isBold = false}) {
  return TextStyle(
    fontFamily: AppFonts.roboto,
    fontSize: AppSizes.bodySmall,
    fontWeight: isBold ? AppWeights.bold : AppWeights.normal,
  );
}

TextStyle bodyNormalTextStyle({bool isBold = false}) {
  return TextStyle(
    fontFamily: AppFonts.roboto,
    fontSize: AppSizes.bodyMedium,
    fontWeight: isBold ? AppWeights.bold : AppWeights.normal,
  );
}

TextStyle bodyLargeTextStyle({bool isBold = false}) {
  return TextStyle(
    fontFamily: AppFonts.roboto,
    fontSize: AppSizes.bodyLarge,
    fontWeight: isBold ? AppWeights.bold : AppWeights.normal,
  );
}

TextStyle titleSmallTextStyle({bool isBold = false}) {
  return TextStyle(
    fontFamily: AppFonts.roboto,
    fontSize: AppSizes.titleSmall,
    fontWeight: isBold ? AppWeights.bold : AppWeights.normal,
  );
}

TextStyle titleNormalTextStyle({bool isBold = false}) {
  return TextStyle(
    fontFamily: AppFonts.roboto,
    fontSize: AppSizes.titleMedium,
    fontWeight: isBold ? AppWeights.bold : AppWeights.normal,
  );
}

TextStyle titleLargeTextStyle({bool isBold = false}) {
  return TextStyle(
    fontFamily: AppFonts.roboto,
    fontSize: AppSizes.titleLarge,
    fontWeight: isBold ? AppWeights.bold : AppWeights.normal,
  );
}
