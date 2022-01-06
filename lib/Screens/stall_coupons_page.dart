import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_app_test1/constants.dart';

import 'package:qrscan/qrscan.dart' as scanner;
import 'dart:async';

class StallCouponsPage extends StatefulWidget {
  static const String id = 'stall_coupons_page';
  static String email;

  @override
  _StallCouponsPageState createState() => _StallCouponsPageState();
}

class _StallCouponsPageState extends State<StallCouponsPage> {
  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      return barcode;
    }
  }

  Widget _myAlertDialogue(String title, String content) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.lightBlueAccent,
          child: Text('OK',
          style: TextStyle(
            color: Colors.black,
          ),),
        )
      ],
//      elevation: 24.0,
    insetAnimationCurve: Curves.bounceIn,
    );
  }

  Widget _buildListCoupon(BuildContext context, DocumentSnapshot document) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Material(
        color: Colors.white24,
        elevation: 14.0,
        shadowColor: Colors.white70,
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white70, width: 3.0),
              borderRadius: BorderRadius.all(Radius.circular(24.0)),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10, color: Colors.white12, offset: Offset(1, 3))
              ]),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        '${document['name']} ',
                        style: GoogleFonts.baloo(textStyle: kInfoHeadingStyle),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Coupons left :${document['number']}',
                        style: GoogleFonts.baloo(textStyle: kInfoTextStyle),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      RaisedButton(
                        onPressed: () async{
                          if (document['number'] != 0) {
                            String scanString = await scanner.scan();
                            if(scanString == document['name']){
                              document.reference.updateData({
                                'number': document['number'] - 1,
                              });
                            }
                            else{
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    _myAlertDialogue('Wrong Coupon', 'This is not $scanString coupon'),
                                barrierDismissible: false,
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (context) =>
                                  _myAlertDialogue('No coupons Left', 'You have used all the coupons'),
                              barrierDismissible: false,
                            );
                          }
                        },
                        color: Colors.lightBlueAccent,
                        child: Text('Redeem'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24.0),
                    child: Image(
                      fit: BoxFit.contain,
                      alignment: Alignment.topRight,
                      image: AssetImage('images/2019 logo.jpg'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('images/index.jpg'),
          //   fit: BoxFit.cover,
          //   colorFilter: ColorFilter.linearToSrgbGamma(),
          // ),
        ),
        child: StreamBuilder(
          stream:
              Firestore.instance.collection('Users').document(StallCouponsPage.email).collection('StallCoupons').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loding...');
            return ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) =>
                  _buildListCoupon(context, snapshot.data.documents[index]),
            );
          },
        ),
      ),
    );
  }
}
