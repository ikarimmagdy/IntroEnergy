import 'package:flutter/material.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';

class IEConsumptionsPage extends StatefulWidget {
  static const String routeName = '/consumptions';

  @override
  State<StatefulWidget> createState() {
    return _IEConsumptionsState();
  }
}

class _IEConsumptionsState extends State<IEConsumptionsPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Consumptions"),
        ),
        drawer: IESideMenu(),
        body: Padding(padding: EdgeInsets.all(10), child: _createList()));
  }

  Widget _createDataTable() {
    return DataTable(columns: [
      DataColumn(label: Text("")),
      DataColumn(label: Text("")),
      DataColumn(label: Text("")),
    ], rows: [
      DataRow(cells: [DataCell(Text("sdsdsd"))])
    ]);
  }
}

Widget _createList() {
  return Column(
    children: [
      _createTitle("Meter Info"),
      _createMeterInfo(),
      ListView.builder(
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return _createCard();
      },
    )],
  );
}

Widget _createCard() {
  return Card(
    child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text("Start: ",style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 15),
                ),
                Text("Cost:",style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontSize: 15)),
                Text("Month:"),
              ],),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("0 KWh ",style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.blueAccent,
                      fontSize: 15),
                  ),
                  Text("534.89 KWh ",style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.green,
                      fontSize: 15)),
                  Text("June 2020"),
                ],),
              )
            ],
          ),
          Text("View invoice",style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black12,
              fontSize: 15),
          ),

        ],),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Current: ",style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 15),
                    ),
                    Text("Cons.:",style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                        fontSize: 15)),
                    Text("Reading:"),
                  ],),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("534 KWh ",style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.red,
                          fontSize: 15),
                      ),
                      Text("534.89 EGP ",style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.blueAccent,
                          fontSize: 15)),
                      Text("30-06-2020"),
                    ],),
                )
              ],
            ),
          Text("Download",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen,
              fontSize: 15),
          ),
        ],)
      ],),
    )
  );
}

Widget _createMeterInfo() {
  return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding:EdgeInsets.fromLTRB(0, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Icon(Icons.arrow_back), Text("12223"), Text("4222256")],
                  ),
                )
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding:EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Fllor 1"), Icon(Icons.arrow_forward)],
                  ),
                )
              ],
            ),
          )
        ],
      ));
}

Widget _createTitle(String title) {
  return Container(
    color: Colors.black12,
    child: Padding(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.payment),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 15),
        ),
      ]),
    ),
  );
}