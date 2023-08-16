import 'package:flutter/material.dart';

extension PaddingExtOnWidgets on Widget {
  Padding paddingFromAllSide(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Padding paddingOnOnlySides({
    double top = 0.0,
    double bottom = 0.0,
    double left = 0.0,
    double right = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.only(
          bottom: bottom,
          top: top,
          left: left,
          right: right,
        ),
        child: this,
      );

  Padding paddingSymmetric({
    double horizontal = 0.0,
    double vertical = 0.0,
  }) =>
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        child: this,
      );
}
