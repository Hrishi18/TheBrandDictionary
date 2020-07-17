import 'package:brand_dictionary/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'details.dart';

class LoadJson extends StatelessWidget {
  int value;
  LoadJson({Key key, @required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            return Brands(value: value, mydata: mydata);
          }
        },
      ),
    );
  }
}

class Brands extends StatefulWidget {
  var mydata;

  int value;
  Brands({Key key, @required this.value, this.mydata}) : super(key: key);
  @override
  _BrandsState createState() => _BrandsState(value, mydata);
}

class _BrandsState extends State<Brands> {
  int k = 0, selectedIndex = 0, value;
  List mydata;
  Color myBrandColor;
  _BrandsState(this.value, this.mydata);

  Widget brandCard(int number) {
    //print(mydata[value]["0"][selectedIndex.toString()][k.toString()]["bColor"]);

    if (mydata[value]["0"][selectedIndex.toString()][k.toString()]["bColor"] == 'indiaColor') {
      myBrandColor = indiaColor;
    }
    else if(mydata[value]["0"][selectedIndex.toString()][k.toString()]["bColor"]== 'otherColor'){
      myBrandColor = otherColor;
    }
    else{
      myBrandColor = chinaColor;
    }
    return InkWell(
      highlightColor: kSecondaryColor,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoadJsonAgain(
                  value: value, selectedIndex: selectedIndex, k: number),
            ));
      },
      child: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding / 2,
                  vertical: kDefaultPadding / 2),
              height: 100,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: myBrandColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(22),
                        topRight: Radius.circular(22),
                      ),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 10,
                            color: kSecondaryColor.withOpacity(0.2)),
                      ],
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(22),
                          topRight: Radius.circular(22),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Hero(
                      tag:
                          '${mydata[value]["0"][selectedIndex.toString()][k.toString()]["bName"]}',
                      child: Container(
                        //color: Colors.black,
                        padding: EdgeInsets.fromLTRB(5.0, 20.0, 30.0, 20.0),
                        height: 100,
                        width: 160,
                        child: Image.asset(
                          'assets/images/vodafone.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                      alignment: Alignment.topLeft,
                      //color: Colors.red,
                      height: 50.0,
                      width: 210.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              //'fg',
                              mydata[value]["0"][selectedIndex.toString()]
                                  [k.toString()]["bName"],
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Times New Roman',
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Container(
                              color: kSecondaryColor,
                              height: 1.0,
                              width: 190,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      // color: Colors.red,
                      height: 35.0,
                      width: 210.0,
                      padding: const EdgeInsets.only(left: 20.0),
                      margin: const EdgeInsets.only(bottom: 15.0),
                      child: SvgPicture.asset(
                        mydata[value]["0"][selectedIndex.toString()]
                            [k.toString()]["bFlag"],
                        fit: BoxFit.contain,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //print(selectedIndex);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: kSecondaryColor,
        ),
        elevation: 0.0,
        title: Text(
          'The Brand Dictionary',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: size.height * 0.1,
            child: Stack(
              children: <Widget>[
                Container(
                  height: size.height * 0.4 - 75,
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: kPrimaryColor.withOpacity(0.23),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(60.0, 10.0, 0.0, 0.0),
                  height: 40,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: mydata[value]["1"].length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(
                          left: kDefaultPadding,
                          right: index == mydata[value]["1"].length - 1
                              ? kDefaultPadding
                              : 0,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: kDefaultPadding,
                        ),
                        decoration: BoxDecoration(
                          color: index == selectedIndex
                              ? kSecondaryColor.withOpacity(0.8)
                              : Colors.transparent.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          //'gh'

                          mydata[value]["1"][index],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          // SizedBox(
          //   height: kDefaultPadding / 2,
          // ),
          // Text(
          //   value.toString(),
          //   style: TextStyle(
          //     fontSize: 30.0,
          //     color: Colors.black,
          //   ),
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  for (k = 0;
                      k < mydata[value]["0"][selectedIndex.toString()].length;
                      k++)
                    brandCard(k),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
