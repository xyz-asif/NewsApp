// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

export 'package:nova/screens/view.dart';
export 'package:nova/screens/wallstreet.dart';
export 'package:nova/screens/tesla.dart';
export 'package:nova/screens/business.dart';
export 'package:nova/screens/apple.dart';

Widget titleText(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(fontWeight: FontWeight.w700),
  );
}

Widget autherText(String text) {
  return Text(
    text,
    style: GoogleFonts.lato(
      fontWeight: FontWeight.normal,
    ),
  );
}

Widget contentText(String text) {
  return Text(
    text,
    style: GoogleFonts.poppins(
      fontWeight: FontWeight.w500,
    ),
  );
}

listner(ScrollController sc, int pageNumber, Function fetch) {
  if (sc.position.pixels == sc.position.maxScrollExtent) {
    pageNumber++;
    fetch(pageNumber);
  } else {
    print("dont call function");
  }
}
