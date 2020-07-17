import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'brands.dart';
import 'dart:convert';

class LoadJsonAgain extends StatelessWidget {
  int value, k, selectedIndex;
  LoadJsonAgain({Key key, @required this.value, this.selectedIndex, this.k})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assets/bdata.json"),
        builder: (context, snapshot) {
          List mydata = json.decode(snapshot.data.toString());
          if (mydata == null) {
            return Center(
              child: Text(
                "Loading...",
              ),
            );
          } else {
            return DetailsScreen(
                value: value,
                selectedIndex: selectedIndex,
                k: k,
                mydata: mydata);
          }
        },
      ),
    );
  }
}

class DetailsScreen extends StatefulWidget {
  var mydata;

  int value, selectedIndex, k;

  DetailsScreen(
      {Key key, @required this.value, this.selectedIndex, this.k, this.mydata})
      : super(key: key);

  @override
  _DetailsScreenState createState() =>
      _DetailsScreenState(value, selectedIndex, k, mydata);
}

class _DetailsScreenState extends State<DetailsScreen> {
  List mydata;
  int value, selectedIndex, k;
  Color myDetailBrandColor, myRecTextColor;
  String myRecText;
  _DetailsScreenState(this.value, this.selectedIndex, this.k, this.mydata);

  @override
  Widget build(BuildContext context) {
    if (mydata[value]["0"][selectedIndex.toString()][k.toString()]["bColor"] ==
        'indiaColor') {
      myDetailBrandColor = indiaColor;
      myRecText = 'Go for it!!';
      myRecTextColor = Colors.white;
    } else if (mydata[value]["0"][selectedIndex.toString()][k.toString()]
            ["bColor"] ==
        'otherColor') {
      myDetailBrandColor = otherColor;
      myRecText = "It's your choice!";
      myRecTextColor = Colors.black;
    } else {
      myDetailBrandColor = chinaColor;
      myRecText = 'Avoid!!';
      myRecTextColor = Colors.white;
    }
    //print(selectedIndex);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: myDetailBrandColor,
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: BackButton(
          color: kSecondaryColor,
        ),
        elevation: 0.0,
        title: Text(
          'The Brand Dictionary',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              //height: 200,
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
              ),
              child: Column(
                children: <Widget>[
                  Hero(
                    tag:
                        '${mydata[value]["0"][selectedIndex.toString()][k.toString()]["bName"]}',
                    child: Container(
                      //color: Colors.green,
                      margin: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                      height: size.width * 0.6,
                      width: size.width * 0.6,
                      //padding: EdgeInsets.all(50.0),
                      child: Image.asset(
                        'assets/images/vodafone.png',
                        height: size.width * 0.5,
                        width: size.width * 0.5,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    //color: Colors.red,
                    height: 80.0,
                    width: 210.0,
                    padding: EdgeInsets.all(20.0),
                    margin: EdgeInsets.only(bottom: 20.0),
                    child: SvgPicture.asset(
                      mydata[value]["0"][selectedIndex.toString()][k.toString()]
                          ["bFlag"],
                      fit: BoxFit.contain,
                      //alignment: Alignment.bottomLeft,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        mydata[value]["0"][selectedIndex.toString()]
                            [k.toString()]["bName"],
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Times New Roman',
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 40.0),
                    child: Text(
                      mydata[value]["0"][selectedIndex.toString()][k.toString()]
                          ["bDes"],
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Times New Roman',
                        fontSize: 16.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,               
                child: Text(
                  myRecText,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    fontFamily: 'Times New Roman',
                    color: myRecTextColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
