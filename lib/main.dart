import 'package:flutter/material.dart';
import 'package:flutter_app_bmr/views/bmr_ui.dart';

main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: bmrUI(),
      theme: ThemeData(
        fontFamily: 'Kanit',
      ),
    ),
  );
}
