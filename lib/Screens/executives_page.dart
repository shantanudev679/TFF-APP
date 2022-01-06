import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app_test1/constants.dart';
import 'package:new_app_test1/components/CircularProfile.dart';

class ExecutivesPage extends StatelessWidget {
  static const String id = 'executive_page';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage('images/index.jpg'),
          //   fit: BoxFit.cover,
          // ),
        ),
        child: Scaffold(
          //backgroundColor: Colors.white70,
          appBar: kAppBar,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'OSC',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ProfileColumn(color: Colors.black, name: 'Saksham Jain', imageURL: 'https://drive.google.com/uc?export=view&id=1JTwkLPLVLKi65vxABvL-o25Oz-DnFasN',number: '9041922542',email: 'sjain_be18@thapar.edu', ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'OSC',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    ProfileColumn(color: Colors.black, name: 'Akash', imageURL: 'https://drive.google.com/uc?export=view&id=1HndJrl5f477eUxL1AaR6o86Bq986ERZr',number: '8124125450',email: 'amishra_be18@thapar.edu',),

                  ],
                ),
                SizedBox(
                  height: 50.0,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'DOSC',
                      style: kDesignationStyle,
                    ),
                    SizedBox(height: 10.0,),
                    ProfileColumn(color: Colors.black, name: 'Arushi', imageURL: 'https://drive.google.com/uc?export=view&id=17Iq7YnyNYgi_LLTj4Sku5DJG2w1DoeHM',number: '8872520595',email: 'aaarushi1_be18@thapar.edu',),
                  ],
                ),
                SizedBox(height: 50.0,),
                Column(
                  children: <Widget>[
                    Text(
                      'Finance Head',
                      style: kDesignationStyle,
                    ),
                    SizedBox(height: 10.0,),
                    ProfileColumn(color: Colors.black, name: 'Aryan', imageURL: 'https://drive.google.com/uc?export=view&id=1fCX_qfsjxpMq_jgSLEwnn450SKwtY_oe',number: 'none',email: 'none',),
                  ],
                ),
                SizedBox(height: 30.0,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Executive Board Members',
                      style: kDesignationStyle,
                    ),
                    SizedBox(height: 30.0,),
                    ProfileColumn(color: Colors.black, name: 'Abhishek Arora', imageURL: 'https://drive.google.com/uc?export=view&id=1vOCAn62qQ4NZcxUpTV1yJHX5amLQj9om', number: '7589293149',email: 'aarora4_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Abhishek Bhasin', imageURL: 'https://drive.google.com/uc?export=view&id=1qSTF3s-s9xdz9jy5Ad-2RR05WqnqRAxa',number: '7508501040',email: 'abhasin_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Chirag Mahajan', imageURL: 'https://drive.google.com/uc?export=view&id=1T7wTu2RBYHMjKNjLKYGIHBmDyjlYEFgr',number: '9501355587',email: 'cmahajan_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Divya Jain', imageURL: 'https://drive.google.com/uc?export=view&id=1LBYUSnhL3oOX5SkXZaFv038vBO89Rd7X',number: '8146654995',email: 'djain1_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Arshita Shrivastava', imageURL: 'https://drive.google.com/uc?export=view&id=1X13iHiAeNFgxJWW3BUvcaGYWtpeQ3xZK',number: '7052281439',email: 'asrivastava_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Anirudh Randeva', imageURL: 'https://drive.google.com/uc?export=view&id=1RhdzqKoqC-DVooeFN1eBfZbWzQPBcoPV',number: '8376097827',email: 'arandeva_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Arsheya Srivastav', imageURL: 'https://drive.google.com/uc?export=view&id=1heXbunNQ55mT16NnoisT-VoWe5e5kZz-',number: '9696095681',email: 'asrivastava_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Jai Kalra', imageURL: 'https://drive.google.com/uc?export=view&id=1dy8GhuIdkH5c5ugn5tHzweZOQRZR_UgD',number: '6283428915',email: 'jkalra_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Karan Anand', imageURL: 'https://drive.google.com/uc?export=view&id=1sOvcxFT4CclNaIK4yd1sDGYJiZp9X8bR',number: '9599898191',email: 'kanand_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Rohan Sharma', imageURL: 'https://drive.google.com/uc?export=view&id=1QkDTj2ZhRM_4qy3jo0vB2J1fwTsE84zT',number: '6283427535',email: 'rsharma_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Satyam Verma', imageURL: 'https://drive.google.com/uc?export=view&id=1Q3-h2_ddb-jawoyG-OshfuQ2IjRjSXtQ',number: '9464227733',email: 'sverma_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                    ProfileColumn(color: Colors.black, name: 'Sushant Mahajan', imageURL: 'https://drive.google.com/uc?export=view&id=1lnv2olIOhwhbK5dUuYBPc5j0atoqbdhw',number: '7837917272',email: 'smahajan3_be18@thapar.edu',),
                    SizedBox(height: 20.0,),
                  ],
                ),
                SizedBox(height: 30.0,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//ProfileColumn(color: Colors.black, name: 'Abhishek Arora', imageURL: 'https://drive.google.com/uc?export=view&id=1vOCAn62qQ4NZcxUpTV1yJHX5amLQj9om', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Abhishek Bhasin', imageURL: 'https://drive.google.com/uc?export=view&id=1qSTF3s-s9xdz9jy5Ad-2RR05WqnqRAxa', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Chirag Mahajan', imageURL: 'https://drive.google.com/uc?export=view&id=1T7wTu2RBYHMjKNjLKYGIHBmDyjlYEFgr', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Divya Jain', imageURL: 'https://drive.google.com/uc?export=view&id=1LBYUSnhL3oOX5SkXZaFv038vBO89Rd7X', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Arshita Shrivastava', imageURL: 'https://drive.google.com/uc?export=view&id=1X13iHiAeNFgxJWW3BUvcaGYWtpeQ3xZK', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Aryaman Prabhakar', imageURL: 'https://drive.google.com/uc?export=view&id=1PH61u44iuFAZ5cq_ZP_M4fFO71qLJP-n', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Anirudh Randeva', imageURL: 'https://drive.google.com/uc?export=view&id=1RhdzqKoqC-DVooeFN1eBfZbWzQPBcoPV', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Arsheya Srivastav', imageURL: 'https://drive.google.com/uc?export=view&id=1heXbunNQ55mT16NnoisT-VoWe5e5kZz-', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Jai Kalra', imageURL: 'https://drive.google.com/uc?export=view&id=1dy8GhuIdkH5c5ugn5tHzweZOQRZR_UgD', height: 180, width: 130, radius: 45.0),
//ProfileColumn(color: Colors.black, name: 'Karan Anand', imageURL: 'https://drive.google.com/uc?export=view&id=1sOvcxFT4CclNaIK4yd1sDGYJiZp9X8bR', height: 180, width: 130, radius: 45.0),
