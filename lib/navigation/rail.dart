import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova/screens/techCrunch.dart';
import '../exports/exports.dart';

class Rail extends StatefulWidget {
  @override
  _RailState createState() => _RailState();
}

class _RailState extends State<Rail> {
  int selectedIndex = 0;
  bool extended = false;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      NavigationRail(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        minWidth: 56,
        groupAlignment: 1.0,
        labelType: NavigationRailLabelType.all,
        selectedLabelTextStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontSize: 13,
          letterSpacing: 0.5,
          // shadows: [Shadow(offset: Offset(0, -4.5), color: Colors.black)],
          // decoration: TextDecoration.underline,
          // decorationStyle: TextDecorationStyle.solid,
          // decorationColor: Colors.black,
          // decorationThickness: 4,
        ),
        unselectedLabelTextStyle: TextStyle(
          fontSize: 13,
          letterSpacing: 0.8,
          color: Color.fromARGB(255, 82, 82, 82),
        ),
        onDestinationSelected: (newIndex) {
          setState(() {
            selectedIndex = newIndex;
            pageController.animateToPage(newIndex,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          });
        },
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(15, 25, 0, 0),
          child: Text(
            "N",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.4,
                color: Colors.white),
          ),
        ),
        destinations: [
          NavigationRailDestination(
            icon: SizedBox.shrink(),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text("Business ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          NavigationRailDestination(
            icon: SizedBox.shrink(),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text("TechCrunch ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          NavigationRailDestination(
            icon: SizedBox.shrink(),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text("Tesla",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          NavigationRailDestination(
            icon: SizedBox.shrink(),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text("Trade",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          NavigationRailDestination(
            icon: SizedBox.shrink(),
            label: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: RotatedBox(
                quarterTurns: -1,
                child: Text("Apple ",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
              ),
            ),
          )
        ],
        selectedIndex: selectedIndex,
      ),
      Expanded(
          child: PageView(
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          Container(
            child: Business(),
          ),
          Container(
            child: TechCrunch(),
          ),
          Container(
            child: HomePage(),
          ),
          Container(
            child: WallStreet(),
          ),
          Container(
            child: Apple(),
          ),
        ],
      ))
    ]));
  }
}
