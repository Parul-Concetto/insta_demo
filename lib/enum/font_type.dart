import 'dart:ui';

//TODO:If you added any other font add in this below enum
enum FontFamilyType { roboto }

enum FontWeightType { regular, medium, bold }

getFontFamilyType(FontFamilyType? fontFamilyType) {
  switch (fontFamilyType) {
    case FontFamilyType.roboto:
      return 'Roboto';
    case null:
      return '';
  }
}

getFontWeightType(FontWeightType? fontWeightType) {
  switch (fontWeightType) {
    case FontWeightType.regular:
      return FontWeight.w400;
    case FontWeightType.medium:
      return FontWeight.w500;
    case FontWeightType.bold:
      return FontWeight.w700;
    case null:
      return FontWeightType.regular;
  }
}
