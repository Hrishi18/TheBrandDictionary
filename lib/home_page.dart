import 'package:flutter/material.dart';
import 'constants.dart';
import 'brands.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController colorAnimationController;
  Animation colorTween, iconColorTween;
  int value;
  TextEditingController typeAheadController;

  List<String> catImage = [
    'assets/images/clothes.jpg',
    'assets/images/footwear.jpg',
    'assets/images/fashionaccessories.jpg',
    'assets/images/jewellery.jpg',
    'assets/images/beautyandgrooming.jpg',
    'assets/images/personalcare.jpg',
    'assets/images/babycare.jpg',
    'assets/images/households.jpg',
    'assets/images/cookingessentials.jpg',
    'assets/images/snacksandbeverages.jpg',
    'assets/images/consumerelectronics.jpg',
    'assets/images/pharmacy.jpg',
    'assets/images/sportsaccessories.jpg',
    'assets/images/stationery.jpg',
    'assets/images/travelaccessories.jpg',
    'assets/images/transportation.jpg',
    'assets/images/telecom.jpg',
  ];

  List<String> catName = [
    'Apparels',
    'Footwear',
    'Fashion Accessories',
    'Jewellery',
    'Beauty and Grooming',
    'Personal Care',
    'Baby Care',
    'Households',
    'Cooking Essentials',
    'Snacks and Beverages',
    'Consumer Electronics',
    'Pharmacy',
    'Sports Accessories',
    'Stationery',
    'Travel Accessories',
    'Transportation',
    'Telecom',
  ];

  @override
  void initState() {
    colorAnimationController =
        AnimationController(vsync: this, duration: Duration(seconds: 0));
    colorTween = ColorTween(begin: kPrimaryColor, end: Colors.white)
        .animate(colorAnimationController);
    iconColorTween = ColorTween(begin: Colors.white, end: Colors.black)
        .animate(colorAnimationController);

    super.initState();
  }

  filterCategories() {}

  bool scrollListener(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.axis == Axis.vertical) {
      colorAnimationController.animateTo(scrollInfo.metrics.pixels / 350);
      return true;
    }
    return false;
  }

  Widget category(int number) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
      child: Container(
        height: 150.0,
        width: size.width,
        decoration: BoxDecoration(
          //color: kSecondaryColor,
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(
            image: AssetImage(catImage[number]),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.6), BlendMode.srcOver),
          ),
        ),
        child: FlatButton(
          //splashColor: Colors.red,
          highlightColor: kPrimaryColor,
          padding: EdgeInsets.all(0.0),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoadJson(value: number),
                ));
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 70.0, 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    catName[number],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: "Aclonica",
                      fontSize: 30.0,
                      color: kTextColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(
                  'Are you sure you want to exit?',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Aclonica',
                    fontSize: 20.0,
                  ),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Aclonica',
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Yes, exit',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Aclonica',
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            });

        return value == true;
      },
      child: Scaffold(
        drawer: MyDrawer(),
        body: NotificationListener<ScrollNotification>(
          onNotification: scrollListener,
          child: Container(
            height: double.infinity,
            child: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: size.height * 0.38,
                        child: Stack(
                          children: <Widget>[
                            Container(
                              height: size.height * 0.4 - 95,
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(100.0),
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
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  15.0, 140.0, 15.0, 15.0),
                              child: Container(
                                child: Stack(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 50.0, 20.0, 20.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: TypeAheadField(
                                          textFieldConfiguration:
                                              TextFieldConfiguration(
                                            controller: typeAheadController,
                                            autofocus: false,
                                            cursorColor: kPrimaryColor,
                                            style: DefaultTextStyle.of(context)
                                                .style
                                                .copyWith(
                                                    fontSize: 20.0,
                                                    color: Colors.black,
                                                    fontFamily: 'Aclonica',
                                                    decoration:
                                                        TextDecoration.none),
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                            maxLines: 1,
                                          ),
                                          suggestionsCallback: (pattern) async {
                                            return catName
                                                .where((item) => item
                                                    .toLowerCase()
                                                    .startsWith(
                                                        pattern.toLowerCase()))
                                                .toList();
                                          },
                                          itemBuilder: (context, suggestion) {
                                            return ListTile(
                                              leading:
                                                  Icon(Icons.label_important),
                                              title: Text(
                                                suggestion,
                                                style: TextStyle(
                                                  fontFamily: 'Aclonica',
                                                  color: Colors.black,
                                                ),
                                              ),
                                            );
                                          },
                                          onSuggestionSelected: (suggestion) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoadJson(
                                                          value:
                                                              catName.indexOf(
                                                                  suggestion)),
                                                ));
                                          },
                                        ),
                                        height: 55.0,
                                        decoration: BoxDecoration(
                                          color: kBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          22.0, 20.0, 20.0, 15.0),
                                      child: Text(
                                        'Search for any Brand Category',
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: 'Aclonica',
                                          color: kTextColor,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    )
                                  ],
                                ),
                                height: 120.0,
                                decoration: BoxDecoration(
                                  color: kSecondaryColor,
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  20.0, 80.0, 20.0, 20.0),
                              child: Text(
                                '#आत्मनिर्भरभारत',
                                style: TextStyle(
                                  fontFamily: "YatraOne",
                                  color: kTextColor,
                                  fontSize: 40.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      for (int j = 0; j < 17; j++) category(j),
                    ],
                  ),
                ),
                Container(
                  height: 80,
                  child: AnimatedBuilder(
                    animation: colorAnimationController,
                    builder: (context, child) => buildAppBar(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: colorTween.value,
      elevation: 0,
      titleSpacing: 0.0,
      title: Text(
        'BD',
        textAlign: TextAlign.left,
        style: TextStyle(
          color: iconColorTween.value,
          fontFamily: 'AbrilFatface',
          fontSize: 25.0,
        ),
      ),
      iconTheme: IconThemeData(
        color: iconColorTween.value,
      ),
    );
  }
}
