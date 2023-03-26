import 'package:flutter/material.dart';
import 'package:project/pages/Address.dart';
import 'package:project/pages/home_screen.dart';
import 'package:project/pages/welcomepage.dart';

String mname = "";

//import './detail_screen.dart';
//import './home_screen.dart';
class MeanDrawer extends StatefulWidget {
  String wemail;

  MeanDrawer({super.key, required this.wemail});

  @override
  State<MeanDrawer> createState() => _MeanDrawerState();
}

class _MeanDrawerState extends State<MeanDrawer> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //0 super.initState()
    //;
  /*  mname = "";
    String checkname = widget.wemail;
    print(checkname);
    int len = checkname.length;
    for (int i = 0; i < len - 1; i++) {
      if (checkname[i] != "@") {
        mname = mname + checkname[i];
      } else {
        break;
      }
    }
    print("user is meandrawer$mname");
    setState(() {
      name = name;
    });*/
  }

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            //color: Theme.of(context).primaryColor,
            color: Color.fromARGB(255, 0, 0, 0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        //   image: NetworkImage('https://i.pravatar.cc/300')
                        image: AssetImage('assets/images/login.jpg'),
                      ),
                    ),
                  ),
                  Text(
                    'Welcome $name',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Find Me In!',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'Home_Page',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => home_page(
                      hemail: widget.wemail,
                    ),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.location_searching),
            title: Text(
              'Find Me IN!',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => welcome(remail: widget.wemail),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.nature_outlined),
            title: Text(
              'Address Locater',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FindAdress(),
                  ));
            },
          ),
          ListTile(
            leading: Icon(Icons.nature_outlined),
            title: Text(
              'Lattitude Locater',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FindAdress(),
                  ));
            },
          ),
          ListTile(
              leading: Icon(Icons.batch_prediction),
              title: Text(
                'locate me from image',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              onTap: () {
                /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Predict(),
                    ));*/
              }),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text(
              'About',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              /*  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraGalleryDemo(),
                    ));*/
            },
          ),
        ],
      ),
    );
  }
}
