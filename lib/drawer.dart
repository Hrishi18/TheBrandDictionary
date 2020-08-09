import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'attribution.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final Uri _emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'hrishikesh.gawas99@gmail.com',
      queryParameters: {'subject': 'Feedback'});

  void launchWhatsApp({
    @required String message,
  }) async {
    String url() {
      return "whatsapp://send?text=${Uri.parse(message)}";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Drawer(
      elevation: 20.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: size.width,
              color: kPrimaryColor,
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0, 5.0, 10.0, 8.0),
                        child: Image.asset(
                          'assets/images/bd_launcher_icon.png',
                          fit: BoxFit.contain,
                          height: 90,
                          width: 90,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Brand Dictionary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            fontFamily: 'Aclonica'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.share),
              title: Text(
                'Share',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                Share.share(
                    "Namaskar!\nHere I am sharing with you an app that can make a big difference in the Indian economy, an app that can make our country truly 'Atmanirbhar'.\nOur one small habit can make a great difference in the economy of our country. Let's start preferring products Made in India, Let's start preferring products owned by Indians, Let's get vocal for local! Let's make a change!\n http://play.google.com/store/apps/details?id=com.hrishikeshgawas.branddictionary \nDownload 'Brand Dictionary - Atmanirbharbharat' app available on google play store and get educated and aware of truly Indian brands born and brought up in the country. No Ads, No Subscription, Only Nationalism.\nLet's *Be Indian, Buy Indian!*\nJai Hind!");
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.rate_review),
              title: Text(
                'Rate',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                try {
                  launch(
                      "market://details?id=com.hrishikeshgawas.branddictionary");
                } catch (ActivityNotFoundException) {
                  launch(
                      "http://play.google.com/store/apps/details?id=com.hrishikeshgawas.branddictionary");
                }
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.file_download),
              title: Text(
                'Other Apps',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                launch(
                    "http://play.google.com/store/apps/developer?id=Hrishikesh+Mahadev+Gawas");
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.update),
              title: Text(
                'Update',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text('This is the latest version!')));
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text(
                'Feedback',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                launch(_emailLaunchUri.toString());
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.copyright),
              title: Text(
                'Attributions',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Attribution()));
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text(
                'Terms and Conditions',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                launch(
                    "https://sites.google.com/view/branddictionary-termsandcondit");
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.lock),
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                launch(
                    "https://sites.google.com/view/branddictionary-privacypolicy");
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.android),
              title: Text(
                'Version',
                style: TextStyle(
                  fontFamily: 'Aclonica',
                ),
              ),
              onTap: () {
                Navigator.pop(context);
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Version 1.0.0')));
              },
              enabled: true,
              selected: true,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
