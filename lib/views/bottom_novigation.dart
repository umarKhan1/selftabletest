import 'package:flutter/material.dart';

import 'package:selftabletest/views/profile/profile_imports.dart';

import '../utils/application_color.dart';
import 'home/core/home_view_import.dart';

class BottomScreen extends StatefulWidget {
  static const routeName = '/BottomScreen';

  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  int currentNav = 0;

  static final List<Widget> _pages = <Widget>[
    const Homeview(),
    const ProfileView()
    // const FavouriteScreen(),
  ];

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('PREMED GO'),
            content: const Text('Aye You Sure, You Want to exit?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                //return false when click on "NO"
                child: const Text('No'),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                //return true when click on "Yes"
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        body: Center(
          child: _pages.elementAt(currentNav), //New
        ),
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: Container(
            height: 80,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ButtonGradientColor.bottomnavigationColor,
                    ButtonGradientColor.bottomnavigationColortwo,
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor:
                  ButtonGradientColor.bottomnavigationselectedColor,

              showUnselectedLabels: true,
              showSelectedLabels: true,
              type: BottomNavigationBarType.fixed,
              // selectedLabelStyle: const TextStyle(color: Colors.white),
              // unselectedLabelStyle: const TextStyle(color: Colors.white),
              currentIndex: currentNav,

              items: [
                BottomNavigationBarItem(
                    label: "Cats",
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.asset(
                        "assets/images/vl.png",
                        color: currentNav == 0
                            ? ButtonGradientColor.bottomnavigationselectedColor
                            : Colors.black,
                      ),
                    )),
                BottomNavigationBarItem(
                    label: "Me",
                    icon: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Image.asset("assets/images/me.png",
                          color: currentNav == 1
                              ? ButtonGradientColor
                                  .bottomnavigationselectedColor
                              : Colors.black),
                    )),
              ],
              onTap: (index) {
                setState(() {
                  currentNav = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
