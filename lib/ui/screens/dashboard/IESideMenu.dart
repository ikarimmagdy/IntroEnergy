import 'package:flutter/material.dart';
import 'package:intro_energy/routes/routes.dart';

class IESideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(
              icon: Icons.contacts,
              text: 'Dashboard',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.dashboard)),
          _createDrawerItem(
              icon: Icons.event,
              text: 'Meters',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.meters)),
          _createDrawerItem(
              icon: Icons.note,
              text: 'Payments',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.payments)),
          Divider(),
          _createDrawerItem(
              icon: Icons.collections_bookmark,
              text: 'Consumptions',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.consumptions)),
          _createDrawerItem(
              icon: Icons.face,
              text: 'History',
              onTap: () =>
                  Navigator.pushReplacementNamed(context, Routes.history)),
          _createDrawerItem(icon: Icons.account_box, text: 'Support'),
          Divider(),
          ListTile(
            title: Text('Version - 0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
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
}
