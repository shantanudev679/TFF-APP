import 'package:flutter/material.dart';
import 'package:new_app_test1/constants.dart';

class AboutUsPage extends StatelessWidget {
  static const String id = 'AboutUs_Page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        appBar:  kAppBar,
        body: Padding(
          padding: EdgeInsets.only(top: 10.0, left: 0.0, right: 0.0),
          child: Container(
            decoration: BoxDecoration(
//              image: DecorationImage(
//                image: ExactAssetImage('images/heartbeat.jpg'),
//                fit: BoxFit.cover,
//              ),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Text(
                  'Who We Are',
                  style: kInfoHeadingStyle,
                ),
                Text(
                  'Thapar Food Festival is one of the most magnificient and pompous fests of Thapar Institute of Engineering and Technology. The fest takes place in September and with Coca-Cola as our title sponsor, we hope mesmerise more people by the beauty of food .',
                  style: kInfoTextStyle,
                ),
                SizedBox(
                  height: 25.0,
                ),
                Text(
                  'THE PALLETE OF FLAVOURS',
                  style: kInfoHeadingStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'The theme, a palette of flavors is an idea revolving around the concept that basic flavors blend to give rise to an assortment of flavors bringing about the diversity in food. The motive is to bring to light, foods that are visually appealing and exquisitely flavoured.',
                  style: kInfoTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}