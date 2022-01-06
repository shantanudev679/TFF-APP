import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const kProfileNameStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 17.0,
//  fontFamily:
);

const kDesignationStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 20.0,
);

const kInfoHeadingStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 25.0,
  color: Colors.yellowAccent,
  decoration: TextDecoration.underline,
  // shadows: [
  //   // Shadow( // bottomLeft
  //   //     offset: Offset(-1.0, -1.0),
  //   //     color: Colors.white
  //   // ),
  //   // Shadow( // bottomRight
  //   //     offset: Offset(0.5, -0.5),
  //   //     color: Colors.white
  //   // ),
  //   // Shadow( // topRight
  //   //     offset: Offset(0.5, 0.5),
  //   //     color: Colors.white
  //   // ),
  //   // Shadow( // topLeft
  //   //     offset: Offset(-0.5, 0.5),
  //   //     color: Colors.white
  //   // ),
  // ]
);

const kInfoTextStyle = TextStyle(
  fontSize: 19.0,
  color: Colors.white,
);

AppBar kAppBar = new AppBar(
  backgroundColor: Colors.greenAccent,
  elevation: 20.0,
  title: Text(
    'THAPAR FOOD FEST',
    style: GoogleFonts.lora(
      fontSize: 23.0,
      textStyle: TextStyle(fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            offset: Offset(-1.0, -1.0),
            color: Colors.black54,
          )
        ]
      ),
    ),
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
