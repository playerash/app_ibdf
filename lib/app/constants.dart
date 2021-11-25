import 'package:flutter/material.dart';

final kDefaultInputDecorationTheme = InputDecorationTheme(
  border: kDefaultOutlineInputBorder,
  enabledBorder: kDefaultOutlineInputBorder,
  focusedBorder: kDefaultOutlineInputBorder,
);

final kDefaultOutlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(50),
  borderSide: const BorderSide(
    color: Color(0xFFCEE4FD),
  ),
);

const kColorAzulPrincipal = Color(0xff090F37);
const kColorAmareloPrincipal = Color(0xFFE0B723);
