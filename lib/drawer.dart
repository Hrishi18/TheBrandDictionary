import 'package:flutter/material.dart';
import 'constants.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      elevation: 20.0,
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
                    //color: Colors.white,
                    child: Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 15.0),
                    child: Image.asset(
                      'assets/images/jio.png',
                      fit: BoxFit.scaleDown,
                      height: 70,
                      width: 70,
                    ),
                  ),
                  ),
                  Text(
                    'The Brand Dictionary',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          // UserAccountsDrawerHeader(
          //   accountName: Text('Hrishikesh Gawas'),
          //   accountEmail: Text('hrishikesh.gawas99@gmail.com'),
          //   currentAccountPicture: CircleAvatar(
          //     child: Text(
          //       'H',
          //       style: TextStyle(
          //         color: Colors.black,
          //       ),
          //     ),
          //   ),
          //   otherAccountsPictures: <Widget>[
          //     CircleAvatar(
          //       child: Text(
          //         'h',
          //       ),
          //     ),
          //     CircleAvatar(
          //       child: Text(
          //         'g',
          //       ),
          //     ),
          //   ],
          //   onDetailsPressed: () {},
          // ),
          ListTile(
            leading: Icon(Icons.pages),
            title: Text(
              'Page Two',
            ),
            onTap: () {
              print('List Tile Tapped');
            },
            enabled: true,
            selected: true,
            //trailing:Icon(Icons.contacts) ,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text(
              'Contacts',
            ),
            onTap: () => print('List Tile Tapped'),
            enabled: true,
            selected: true,
            //trailing:Icon(Icons.contacts) ,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text(
              'Contacts',
            ),
            onTap: () => print('List Tile Tapped'),
            enabled: true,
            selected: true,
            //trailing:Icon(Icons.contacts) ,
          ),
          Divider(),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListTile(
                leading: Icon(Icons.bug_report),
                title: Text(
                  'Bug',
                ),
                onTap: () => print('List Tile Tapped'),
                enabled: true,
                selected: true,
                //trailing:Icon(Icons.contacts) ,
              ),
            ),
          )
        ],
      ),
    );
  }
}
