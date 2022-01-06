import 'package:flutter/material.dart';
import 'package:new_app_test1/constants.dart';

class ProfileColumn extends StatelessWidget {
  ProfileColumn({this.color, @required this.name, @required this.imageURL, this.number, this.email});
  final Color color;
  final String name;
  final String imageURL;
  final String number;
  final String email;
//  final double height;
//  final double width;
//  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 14.0,
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        height: 250,
        width: 230,
        child: Column(
          children: <Widget>[
//            SizedBox(height: 8.0,),
            Container(
              width: double.infinity,
              height: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage(imageURL),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              name,
              style: kProfileNameStyle,
            ),
            Text(number, style: TextStyle(color: Colors.black),),
            Text(email,style: TextStyle(color: Colors.black),),
          ],
        ),
      ),
    );
  }
}

//CircleAvatar(
//backgroundColor: color,
//radius: radius + 5.0,
//child: CircleAvatar(
//radius: radius,
//backgroundImage: NetworkImage(imageURL),
//),
//),