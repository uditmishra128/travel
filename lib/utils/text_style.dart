import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rideapp/utils/meta.dart';

TextStyle headingStyle(
    {required BuildContext context,
    required double size,
    required Color color}) {
  return Theme.of(context)
      .textTheme
      .headline1!
      .copyWith(fontSize: size, color: color);
}

TextStyle bodyStyle(
    {required BuildContext context,
    required double size,
    required Color color}) {
  return Theme.of(context)
      .textTheme
      .bodyText1!
      .copyWith(fontSize: size, color: color);
}

textStyle(Color _color, double _size, FontWeight _weight, String _fontFam) =>
    TextStyle(
        color: _color,
        fontWeight: _weight,
        fontFamily: _fontFam,
        fontSize: _size);
TextStyle textStyle1 = TextStyle(
    color: lightBlue,
    fontWeight: FontWeight.w700,
    fontSize: 24,
    fontFamily: 'Poppins');
TextStyle textStyle2 = const TextStyle(
    color: Colors.black54,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    fontFamily: 'Poppins');

TextStyle textStyle3 = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontFamily: 'NunitoSans',
    fontSize: 15.0);
TextStyle textStyle4 = TextStyle(
    color: lightBlue,
    fontSize: 48,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w700);
TextStyle textStyle5 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.bold,
    fontFamily: 'NunitoSans',
    color: Colors.grey[400]);
TextStyle textStyle6 = const TextStyle(
  fontSize: 17.0,
  fontFamily: 'NunitoSans',
  color: Colors.black54,
);
TextStyle textStyle7 = const TextStyle(
  color: Colors.orange,
  fontSize: 12,
  decoration: TextDecoration.underline,
);
TextStyle textStyle8 =
    const TextStyle(color: black, fontSize: 25, fontWeight: FontWeight.w600);
TextStyle textStyle9 = TextStyle(
    fontSize: 18,
    color: black.withOpacity(.5),
    fontFamily: 'Pacifico',
    fontWeight: FontWeight.w500);
