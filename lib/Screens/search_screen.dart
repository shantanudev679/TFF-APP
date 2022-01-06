import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app_test1/Screens/registration_screen.dart';
import 'package:new_app_test1/Screens/stall_coupons_page.dart';
import 'package:new_app_test1/constants.dart';
import 'package:new_app_test1/main.dart';

class SearchScreen extends StatefulWidget {
  static const String id = 'search_screen_id';
  static String couponName;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextEditingController =
      new TextEditingController();
  QuerySnapshot searchSnapshot;

  getUserByEmail(String email) async {
    return await Firestore.instance
        .collection("Users")
        .where("email", isEqualTo: email)
        .getDocuments();
  }

  initiateSearch() {
    getUserByEmail(searchTextEditingController.text.trim()).then((val) {
      setState(() {
        searchSnapshot = val;
      });
      print(searchSnapshot.documents.length);
      print(searchSnapshot.documents[0].data["email"]);
    });
  }

  Widget searchTile() {
    return searchSnapshot != null
        ? ListView.builder(
            shrinkWrap: true,
            itemCount: searchSnapshot.documents.length,
            itemBuilder: (context, index) {
              return SearchTile(searchSnapshot.documents[0].data["email"]);
            },
          )
        : Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kAppBar,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/index.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.linearToSrgbGamma(),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              color: Colors.lightGreenAccent,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: kTextFieldDecoration,
                      controller: searchTextEditingController,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      initiateSearch();
                    },
                    child: Container(
                      height: 50.0,width: 50.0,
                      child: Icon(Icons.search, size: 40,),
                    ),
                  ),
                ],
              ),
            ),
            searchTile(),
          ],
        ),
      ),
    );
  }
}

class SearchTile extends StatelessWidget {
  SearchTile(this.searchEmail);
  final String searchEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '$searchEmail',
                  style: TextStyle(color: Colors.black),
                ),
                GestureDetector(
                  onTap: () async{
                    CollectionReference currentUserCollection = Firestore.instance.collection('Users').document(StallCouponsPage.email).collection('OfferCoupons');
                    QuerySnapshot userSnapshot = await currentUserCollection.getDocuments();
                    int i=0;
                    for(i = 0; i < userSnapshot.documents.length; ++i){
                      if(userSnapshot.documents[i].data['name'] == SearchScreen.couponName)
                        break;
                    }

                    DocumentSnapshot userDocument = userSnapshot.documents[i];
                    userDocument.reference.updateData({
                      'number' : userDocument['number'] - 1,
                    });

                    if(userDocument['number']  == 1){
                      userDocument.reference.delete();
                    }

                    CollectionReference receiverCollection = Firestore.instance.collection('Users').document(searchEmail).collection('OfferCoupons');
                    QuerySnapshot receiverSnapshot = await receiverCollection.getDocuments();
                    i = 0;
                    for(; i < receiverSnapshot.documents.length; ++i){
                      if(receiverSnapshot.documents[i].data['name'] == SearchScreen.couponName)
                        break;
                    }
                    if(i == receiverSnapshot.documents.length){
                      Map<String, dynamic> tasks;
                      tasks = {
                        'name' : SearchScreen.couponName,
                        'number' : 1,
                      };
                      DocumentReference ds = receiverCollection.document(SearchScreen.couponName);
                      ds.setData(tasks).whenComplete(() => print('Transferred'));
                    }else{
                      DocumentSnapshot receiversDocument = receiverSnapshot.documents[i];
                      receiversDocument.reference.updateData({
                        'number' : receiversDocument['number'] + 1,
                      });
                    }
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.lightBlueAccent,
                    ),
                    child: Center(child: Text('Send')),
                  ),
                ),
              ],
            ),
            Text("____________________________________"),
          ],
        ),
      ),
    );
  }
}
