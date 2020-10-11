import 'package:flutter/material.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';
import 'package:intro_energy/ui/screens/history/IEHistoryPage.dart';

class IEMetersPage extends StatefulWidget {
  static const String routeName = '/meters';

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
     return _IEMetersPageState();
  }
}

class _IEMetersPageState extends State<IEMetersPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Meters"),
        ),
        drawer: IESideMenu(),
        body: GridView.count(
          crossAxisCount: 2 ,
          children: [
            _buildCard("This Month","1289 KWh" ,Colors.green ),
            _buildCard("Reading Date","27-09-2020" ,Colors.blueAccent ),
            _buildCard("Tarrif Step","1.45 EGP" ,Colors.red ),
            _buildCard("Current Balance","128.08 EGP" ,Colors.red ),
            _buildCard("Meter Status","Connected" ,Colors.blueAccent ),
            _buildCard("Tarrif","Commercial" ,Colors.red ),
            _buildCard("Serial","12345678" ,Colors.blueAccent ),
            _buildCard("Address","Floot 1- Shop A100" ,Colors.red ),
          ],
        ));
  }
  Widget _buildCard(String title,String value,Color color){
    return SizedBox(
      width: 300,
      height: 300,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Padding(padding: EdgeInsets.all(10),child: Text(title,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 17,color:Colors.black26))),

            Text(value,style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: color),)
        ],),
      ),
    );
    
  }
}
