import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_energy/ui/screens/dashboard/IEDrawerHeader.dart';
import 'IEDrawerHeader.dart';
class Dashboard extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DashboardState();
  }
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Into Energy"),
      ),
      drawer: Drawer(child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon:Icons.contacts,text:"Dashboard"),
          _createDrawerItem(icon:Icons.contacts,text:"Meters"),
          _createDrawerItem(icon:Icons.contacts,text:"Payments"),
          _createDrawerItem(icon:Icons.contacts,text:"Consumptions"),
          _createDrawerItem(icon:Icons.contacts,text:"History"),
          Divider(),
          _createDrawerItem(icon:Icons.contacts,text:"Support"),
        ListTile(title: Text("0.0.1"),onTap: (){},)

        ],),),
    );
  }
}


Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('path/to/header_background.png'))),
      child: Stack(children: <Widget>[
        Positioned(
            bottom: 12.0,
            left: 16.0,
            child: Text("Ahmed Ahmed",
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500))),
      ]));
}


Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(text),
        )
      ],
    ),
    onTap: onTap,
  );
}