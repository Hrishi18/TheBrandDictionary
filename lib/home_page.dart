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
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    'assets/images/car.jpg',
    'assets/images/clothes.jpg',
    
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
    'Pet Supplies',
    'Health Care',
    'Consumer Electronics',
    'Mobile Applications',
    'Mobile Games',  
    'Pharmacy',    
    'Home Decor',
    'Kitchen Ware',   
    'Toys and Games',
    'Sports and Fitness',
    'Stationery',
    'Travel Accessories', 
    'Transportation',
    'Telecom',
    'Financial Institutions',   
    
  ];

  List<IconData> catIcon = [
    
    Icons.fitness_center,
    Icons.calendar_today,
    Icons.dashboard,
    Icons.delete,
    Icons.dashboard,
    Icons.crop_portrait,
    Icons.fitness_center,
    Icons.calendar_today,
    Icons.dashboard,
    Icons.delete,
    Icons.dashboard,
    Icons.crop_portrait,
    Icons.fitness_center,
    Icons.calendar_today,
    Icons.dashboard,
    Icons.delete,
    Icons.dashboard,
    Icons.crop_portrait,
    Icons.fitness_center,
    Icons.calendar_today,
    Icons.dashboard,
    Icons.delete,
    Icons.dashboard,
    Icons.crop_portrait,
    Icons.fitness_center,
   
  ];

  //void Function(AnimationStatus) _statusListener;

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
                Colors.black.withOpacity(0.5), BlendMode.srcOver),
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
                  //color: Colors.red,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    catName[number],
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontFamily: 'Times New Roman',
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

    return Scaffold(
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
                      height: size.height * 0.4,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            height: size.height * 0.4 - 65,
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
                                15.0, 150.0, 15.0, 15.0),
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
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily: 'Times New Roman',
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
                                          //print((catIcon.indexOf(suggestion)).toInt());
                                          return ListTile(
                                            leading: Icon(catIcon[
                                                (catName.indexOf(suggestion))
                                                    .toInt()]),
                                            title: Text(
                                              suggestion,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),

                                            //  subtitle: Text('\$${suggestion['price']}'),
                                          );
                                        },
                                        // transitionBuilder: (context, suggestion, controller){
                                        //   return suggestionsBox;
                                        // },
                                        onSuggestionSelected: (suggestion) {
                                          
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => LoadJson(
                                                    value: catName
                                                        .indexOf(suggestion)),
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
                                        fontSize: 17.0,
                                        fontFamily: 'Times New Roman',
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
                                20.0, 110.0, 20.0, 20.0),
                            child: Text(
                              '#Atmanirbharbharat',
                              style: TextStyle(
                                fontFamily: 'Times New Roman',
                                color: kTextColor,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    for (int j = 0; j < 25; j++) category(j),
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
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: colorTween.value,
      elevation: 0,
      // leading: IconButton(
      //   onPressed: () {
      //     Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) =>
      //               Drawer(),
      //         ));
      //   },
      //   icon: Icon(
      //     Icons.menu,
      //   ),
      // ),
      titleSpacing: 0.0,
      title: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'The Brand Dictionary',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: iconColorTween.value,
          ),
        ),
      ),
      iconTheme: IconThemeData(
        color: iconColorTween.value,
      ),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(
//             Icons.local_grocery_store,
//           ),
//           onPressed: () {
// //                          Navigator.of(context).push(TutorialOverlay());
//           },
//         ),
//         IconButton(
//           icon: Icon(
//             Icons.more_vert,
//           ),
//           onPressed: () {},
//         ),
//       ],
    );
  }
}

// TextField(
//                                         onChanged: (value) {},
//                                         decoration: InputDecoration(
//                                             // hintText: 'Search Now...',
//                                             enabledBorder: InputBorder.none,
//                                             focusedBorder: InputBorder.none,
//                                             suffixIcon: Icon(
//                                               Icons.search,
//                                             ),
//                                             contentPadding:
//                                                 EdgeInsets.symmetric(
//                                               horizontal: 20.0,
//                                               vertical: 8.0,
//                                             )),
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontFamily: 'Times New Roman',
//                                           fontSize: 20.0,
//                                         ),
//                                       ),
