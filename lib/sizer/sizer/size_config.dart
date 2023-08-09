import 'dart:math';

import 'package:flutter/material.dart';

const double designDefaultScreenWidth = 376;
const double designDefaultScreenHeight = 668;

class SizeConfig {
  static Size defaultSize =
      const Size(designDefaultScreenWidth, designDefaultScreenHeight);

  static late SizeConfig _instance;

  /// Size of the phone in UI Design , dp
  late Size uiSize;

  late Orientation _orientation;

  late double _pixelRatio;
  late double _screenWidth;
  late double _screenHeight;
  late double _statusBarHeight;
  late double _bottomBarHeight;

  factory SizeConfig() {
    return _instance;
  }

  SizeConfig._();

  static void init(BoxConstraints constraints, BuildContext context) {
    _instance = SizeConfig._()
      ..uiSize = defaultSize
      .._screenWidth = constraints.maxWidth
      .._screenHeight = constraints.maxHeight;

    final windowP = View.of(context);
    _instance._pixelRatio = windowP.devicePixelRatio;
    _instance._statusBarHeight = windowP.padding.top;
    _instance._bottomBarHeight = windowP.padding.bottom;
  }

  ///Get screen orientation
  Orientation get orientation => _orientation;

  /// The number of font pixels for each logical pixel.
  double get textScaleFactor => 1;

  /// The size of the media in logical pixels (e.g, the size of the screen).
  double get pixelRatio => _pixelRatio;

  /// The horizontal extent of this size.
  double get screenWidth => _screenWidth;

  ///The vertical extent of this size. dp
  double get screenHeight => _screenHeight;

  /// The offset from the top, in dp
  double get statusBarHeight => _statusBarHeight / _pixelRatio;

  /// The offset from the bottom, in dp
  double get bottomBarHeight => _bottomBarHeight / _pixelRatio;

  /// The ratio of actual width to UI design
  double get scaleWidth =>
      _screenWidth < uiSize.width ? 1 : _screenWidth / uiSize.width;

  /// The ratio of actual height to UI design
  double get scaleHeight =>
      _screenHeight < uiSize.height ? 1 : _screenHeight / uiSize.height;

  double get scaleText => min(scaleWidth, scaleHeight);

  /// Adapted to the device width of the UI Design.
  /// Height can also be adapted according to this to ensure no deformation ,
  /// if you want a square
  double setWidth(num width) => width * scaleWidth;

  /// Highly adaptable to the device according to UI Design
  /// It is recommended to use this method to achieve a high degree of adaptation
  /// when it is found that one screen in the UI design
  /// does not match the current style effect, or if there is a difference in shape.
  double setHeight(num height) => height * scaleHeight;

  ///Adapt according to the smaller of width or height
  double radius(num r) => r * scaleText;

  ///Font size adaptation method
  ///- [fontSize] The size of the font on the UI design, in dp.
  /// divide by text scale factor, doesn't impact our calculations.
  /// in case user change font size in accessibility in the device,
  /// it will not increase font size that's why we are dividing with text scale
  /// facto
  double setSp(num fontSize) => fontSize * scaleText;
}

extension SizeExtension on num {
  double get w => SizeConfig().setWidth(this);

  double get h => SizeConfig().setHeight(this);

  double get r => SizeConfig().radius(this);

  double get sp => SizeConfig().setSp(this);

  ///smart size :  it check your value if it is bigger than your value set your value
  ///for example you have set 16.setMin() , if for your screen 16.sp() bigger than 16 it will  set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get setMin => min(toDouble(), sp);

  double get setMax => max(toDouble(), sp);

  ///Multiple of screen width
  double get screenWidthMultiple => SizeConfig().screenWidth * this;

  ///Multiple of screen height
  double get screenHeightMultiple => SizeConfig().screenHeight * this;
}
