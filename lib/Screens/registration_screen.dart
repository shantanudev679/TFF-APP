import 'package:flutter/material.dart';
import 'package:new_app_test1/components/rounded_button.dart';
import 'package:new_app_test1/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app_test1/Screens/home_page.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_app_test1/main.dart';
import 'package:video_player/video_player.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';
  static String emailId;
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;



  createCoupons() {
    List<String> _names = [
      "Keventers",
      "Boston Bites",
      "Pizza Hut",
      "Gastro",
      "Uncle Jacks",
    ];
    List _numbers = [1, 2, 3, 1, 6];
    DocumentReference ds;
    ds = Firestore.instance.collection('Users').document(RegistrationScreen.emailId);
    Map<String, dynamic> tasks;
    tasks = {
      "email" : RegistrationScreen.emailId,
    };
    ds.setData(tasks).whenComplete(() => print("complete"));
    ds = Firestore.instance.collection('Users').document(RegistrationScreen.emailId).collection('OfferCoupons').document('Email');
    ds.setData(tasks).whenComplete(() => null);
    //ds.delete();
    for (int i = 0; i < _names.length; ++i) {
      ds = Firestore.instance
          .collection('Users')
          .document(RegistrationScreen.emailId).collection('StallCoupons').document(_names[i]);
      tasks = {
        "name": _names[i],
        "number": _numbers[i],
      };
      ds.setData(tasks).whenComplete(() {
        print("Complete");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  RegistrationScreen.emailId = value;
                  email = value;
                },
                decoration:
                    kTextFieldDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password'),
              ),
              SizedBox(
                height: 24.0,
              ),
              RoundedButton(
                title: 'Register',
                colour: Colors.blueAccent,
                onPressed: () async {
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      createCoupons();
                      Navigator.popAndPushNamed(context, HomePage.id);
                    }

                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
              SizedBox(height: 100.0,)
            ],
          ),
        ),
      ),
    );
  }
}
