import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';
import 'home_page.dart';
import 'onboarding_screen.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        fontFamily: 'Aclonica',
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      
      ),
      home: new FirstScreen(),
    );
  }
}

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  Image image1;
  @override
  void initState() {
    super.initState();
    image1 = Image.asset('assets/images/bdlogocompressed.png');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(image1.image, context);
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      backgroundColor: Colors.white,
      image: image1,
      photoSize: 80.0,
      title: new Text(
        'Brand Dictionary\nBe Indian, Buy Indian!',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 23.0,
          color: Colors.black,
          fontFamily: 'Aclonica',
        ),
        textAlign: TextAlign.center,
      ),
      loaderColor: Colors.grey,
      navigateAfterSeconds: Splash(),
      loadingText: Text(
        "Developed By,\nHrishikesh Gawas",
        style: TextStyle(
            color: Colors.black, fontSize: 17.0, fontFamily: 'YatraOne'),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MyHomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnboardingScreen()));
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Text('Loading...'),
      ),
    );
  }
}
