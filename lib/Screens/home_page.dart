import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app_test1/Screens/search_screen.dart';
import 'package:new_app_test1/Screens/stall_coupons_page.dart';
import 'package:new_app_test1/Screens/offer_coupons.dart';
import 'package:new_app_test1/constants.dart';
import 'package:new_app_test1/homepage_screens/2016page.dart';
import 'package:new_app_test1/homepage_screens/2017page.dart';
import 'package:new_app_test1/homepage_screens/2018page.dart';
import 'executives_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'about_us.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';

FirebaseUser loggedInUser;

class HomePage extends StatefulWidget {
  static const String id = 'home_page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String email;
  String _qrResult = "Nothing yet";
  List<String> _listOfButtons = [
    "Executives",
    "About Us",
    "Stall Coupons",
    "Offer Coupons",
  ];
  List<String> _listButtonsId = [
    ExecutivesPage.id,
    AboutUsPage.id,
    StallCouponsPage.id,
    OfferCoupons.id,
  ];

  List<String> _listImageButtons = [
    'blackDrink',
    'redCoconut',
    'tomato',
    'redCake',
  ];

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        setState(() {
          email = loggedInUser.email;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      setState(() {
        _qrResult = barcode;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: kAppBar,
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Material(
                elevation: 14.0,
                shadowColor: Colors.white70,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/tffOrientation.jpeg'),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(color: Colors.white70, width: 3.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10, color: Colors.white12, offset: Offset(1, 3))
                      ],
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0))),
                  accountEmail: Text(
                    '$email',
                    style: GoogleFonts.lato(),
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage('images/billa.jpg'),
                  ),
                ),
              ),
              Container(
                height: double.maxFinite,
                child: ListView.builder(
                  itemCount: _listOfButtons.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 14.0),
                      child: Material(
                        borderRadius: BorderRadius.circular(14.0),
                        elevation: 14.0,
                        shadowColor: Colors.white70,
                        child: Container(
                          decoration: BoxDecoration(
                                border: Border.all(color: Colors.white70, width: 3.0),
                                borderRadius: BorderRadius.all(Radius.circular(14.0)),
                                boxShadow: [
                                  BoxShadow(
                                      blurRadius: 10, color: Colors.white12, offset: Offset(1, 3))
                            ],
                            image: DecorationImage(
                              image: AssetImage(
                                  'images/${_listImageButtons[index]}.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: ListTile(
                            title: Text(
                              '${_listOfButtons[index]}',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            onTap: () {
                              if (index == 2) {
                                StallCouponsPage.email = loggedInUser.email;
                              }
                              Navigator.pushNamed(
                                  context, _listButtonsId[index]);
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 250,
                child: PageView(
                  children: [
                    mainPhotoDisplay('images/redCoconut.jpg', 200, 280, 'null'),
                    mainPhotoDisplay('images/tomato.jpg', 200, 280, 'null'),
                    mainPhotoDisplay('images/redCake.jpg', 200, 280, 'null'),
                  ],
                ),
              ),
              SizedBox(
                height: 200,
              ),
              Container(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    mainPhotoDisplay('images/gallery16.jpg', 200, 200, Page16.id),
                    mainPhotoDisplay('images/gallery17.jpg', 200, 200, Page17.id),
                    mainPhotoDisplay('images/gallery18.jpg', 200, 200, Page18.id),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding mainPhotoDisplay(String image, double height, double width, String forNavigator) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: GestureDetector(
        onTap: (){
          if(forNavigator != 'null'){
            Navigator.pushNamed(context, forNavigator);
          }
        },
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
              border: Border.all(color: Colors.white70, width: 3.0),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.white70, offset: Offset(1, 3))
              ]),
        ),
      ),
    );
  }
}
