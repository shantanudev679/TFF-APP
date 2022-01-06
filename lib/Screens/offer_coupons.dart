import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_app_test1/Screens/search_screen.dart';
import 'package:new_app_test1/Screens/stall_coupons_page.dart';
import 'package:new_app_test1/constants.dart';

class OfferCoupons extends StatefulWidget {
  static const String id = 'testing_page_id';

  @override
  _OfferCouponsState createState() => _OfferCouponsState();
}

class _OfferCouponsState extends State<OfferCoupons> {
  Widget _buildOfferCoupon(BuildContext context, DocumentSnapshot document) {
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
                      SizedBox(height: 8.0,),
                      Text(
                        '${document['name']}',
                        style: kInfoHeadingStyle,
                      ),
                      SizedBox(height: 8.0,),
                      Text(
                        '${document['number']} coupon',
                        style: kInfoTextStyle,
                      ),
                      SizedBox(height: 8.0,),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: GestureDetector(
                          onTap: (){
                            SearchScreen.couponName = document['name'];
                            Navigator.pushNamed(context, SearchScreen.id);
                          },
                          child: Container(
                            width: 70,
                            height: 30,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                            ),
                            child: Center(child: Text('Share', style: TextStyle(fontWeight: FontWeight.w600),),),
                          ),
                        ),
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
    return SafeArea(
      child: Scaffold(
        appBar: kAppBar,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/index.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.linearToSrgbGamma(),
            ),
          ),
          child: StreamBuilder(
            stream: Firestore.instance
                .collection('Users')
                .document(StallCouponsPage.email)
                .collection('OfferCoupons')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) =>
                    _buildOfferCoupon(context, snapshot.data.documents[index]),
              );
            },
          ),
        ),
      ),
    );
  }
}
