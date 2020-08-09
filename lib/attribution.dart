import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'constants.dart';

class Attribution extends StatefulWidget {
  @override
  _AttributionState createState() => _AttributionState();
}

class _AttributionState extends State<Attribution> {
  List<String> category = [
    "AbrilFatface Font",
    "Aclonica Font",
    "YatraOne Font",
    "Images",
    "Images",
  ];
  List<String> attributionName = [
    "Fonts by Google",
    "Fonts by Google",
    "Fonts by Google",
    "Images by Pixabay",
    "Images by Pexels",
  ];
  List<String> attributionLink = [
    "https://fonts.google.com/",
    "https://fonts.google.com/",
    "https://fonts.google.com/",
    "https://pixabay.com/da/",
    "https://www.pexels.com/",
  ];

  Widget display(j) {
    return Center(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: InkWell(
              child: new Text(
                category[j],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22.0,
                  fontFamily: 'Aclonica',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
            child: InkWell(
              child: new Text(
                attributionName[j],
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 17.0,
                  //fontFamily: 'Aclonica',
                  decoration: TextDecoration.underline,
                  // decorationThickness: 10.0,
                  //decorationStyle: TextDecorationStyle.dashed,
                ),
                textAlign: TextAlign.left,
              ),
              onTap: () => launch(attributionLink[j]),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        leading: BackButton(
          color: kSecondaryColor,
        ),
        elevation: 0.0,
        title: Text(
          'Brand Dictionary',
          style: TextStyle(
            color: kSecondaryColor,
            fontFamily: 'AbrilFatface',
            fontSize: 25.0,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Divider(),
          for (int j = 0; j < 5; j++) display(j),
        ],
      ),
    );
  }
}
