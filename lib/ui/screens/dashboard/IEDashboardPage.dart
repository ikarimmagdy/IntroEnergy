import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_energy/models/IEConsumptionModel.dart';
import 'package:intro_energy/models/IEPaymentModel.dart';
import 'package:intro_energy/services/IEPaymentServices.dart';
import 'package:intro_energy/ui/commons/IEColors.dart';
import 'package:intro_energy/ui/commons/ThemeText.dart';
import 'package:intro_energy/ui/screens/consumtions/IEConsumptionsPage.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'IESideMenu.dart';

class IEDashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';
  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<IEDashboardPage> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Dashboard", style: TextStyle(color: Colors.white)),
        ),
        drawer: IESideMenu(),
        body: _addBodyWithSlidingPanel());
  }

  Widget _createBody() {
    return Padding(
      padding: EdgeInsets.all(0),
      child: SingleChildScrollView(
        child: Column(children: [
          //_createTitle("Meter Info",Icons.ac_unit),
          //_createMeterInfo(),
          //_createTitle("Latest Payments", Icons.payment),
          _addBalace(),
          //_createPaymentList(),
          _addPreviousPayment(),
          _addPreviousPayment(),
          // _createTitle("Latest Consumptions", Icons.invert_colors_on_sharp),
          _createTarrif(),
          //_addPreviousConsumtion(IEColors.AppColorBlue),
          _addPreviousConsumtion(IEColors.AppColorOrange),
          _addPreviousConsumtion(IEColors.AppColorNavy),
          _addPreviousConsumtion(IEColors.AppColorbrown),
        ]),
      ),
    );
  }

  //1. Add Sliding Panel
  Widget _addBodyWithSlidingPanel(){
    BorderRadiusGeometry radius = BorderRadius.only(
      topLeft: Radius.circular(24.0),
      topRight: Radius.circular(24.0),
    );
    return SlidingUpPanel(
        panelBuilder: (ScrollController sc) => _scrollingList(sc),
      body:_createBody(),
      collapsed: Padding(
        padding: EdgeInsets.all(12),
        child: Container(
          color: IEColors.AppColorBlue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [Text("Floor 1")],),
                Column(children: [Text("1111.2")],),
                Column(children: [Text("11-11-2020")],),
              ],),
        ),
      ),
      color: IEColors.AppColorBlue,
      minHeight: 50,
      maxHeight: 250,
      backdropEnabled: true,
      borderRadius: radius,
    );
  }

  //2. Add Items to the Sliding Panel
  Widget _scrollingList(ScrollController sc){
    return ListView.builder(
      controller: sc,
      itemCount: 10,
      itemBuilder: (BuildContext context, int i){
        return Container(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Column(children: [Text("Floor 1")],),
            Column(children: [Text("1111.2")],),
            Column(children: [Text("11-11-2020")],),
          ],),
        );
      },
    );
  }

  //3.Add Current Balance
  Widget _addBalace(){
    var widget =
    Container(height: 100,color: Colors.black,child:
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [Row(mainAxisAlignment: MainAxisAlignment.start,crossAxisAlignment: CrossAxisAlignment.start, children: [Text("182.23",style: ThemeText.largeText,),SizedBox(width: 5,),Text("EGP",style: ThemeText.miniText,),
        ],)],),
      Column(mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.end,children: [ Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Text("PAY",style: ThemeText.normalText,),IconButton(icon: Icon(Icons.battery_charging_full,color: IEColors.AppColorBlue,))])],)
    ],));
        return widget;
  }
  //4.Add Previous Payments
  Widget _addPreviousPayment(){
    var widget =
    Card(
      color: IEColors.AppColorBlue,
      child:
    ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text("1200",style: ThemeText.normalText,),SizedBox(width: 5,),Text("EGP",style: ThemeText.miniText,)],),
      subtitle: Text("Online",style: ThemeText.miniText),
      trailing: Text("10-20-2020",style: ThemeText.miniText),
    ));
    return widget;
  }

  //6.Add Consumtion
  Widget _addPreviousConsumtion(color){
    var widget =
    Card(
        color: color,
        child:
        ListTile(
          title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text("1200",style: ThemeText.normalText,),SizedBox(width: 5,),Text("EGP",style: ThemeText.miniText,)],),
          subtitle: Row(mainAxisAlignment: MainAxisAlignment.start, children: [Text("300",style: ThemeText.normalText,),SizedBox(width: 5,),Text("KWh",style: ThemeText.miniText,)],),
          trailing: Text("10-20-2020",style: ThemeText.miniText),
        ));
    return widget;
  }


  Widget _createCard({String title, String value, String unit}) {
    return SizedBox(
      height: 75,
      width: (MediaQuery.of(context).size.width / 2) - 10,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: EdgeInsets.fromLTRB(5, 10, 0, 0),
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Stack(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(left: 0, top: 0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 0.0, bottom: 10),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black54,
                                            fontSize: 15))),
                              )
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 0.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                          fontSize: 15),
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      unit,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.lightGreen,
                                          fontSize: 18),
                                    )),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _createBalance() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _createCard(title: "Your Balance", value: "128.08", unit: "EGP"),
        _createCard(title: "This Month", value: "1289", unit: "KWh"),
      ],
    );
  }

  Widget _createTarrif() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _createCard(title: "Tarrif Step -5", value: "1.45", unit: "EGP"),
        _createCard(title: "Meter Status", value: "", unit: "Connected")
      ],
    );
  }

  Widget _createPaymentList() {
    return SizedBox(
      height: 170,
      width: 400,
      child: Column(children: [
        _createHeader("#", "Date", "Amount EGP", "Type"),
        Divider(
          height: 1,
          thickness: 1,
        ),
        FutureBuilder<List<Data>>(
          future: getPaymentList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                child: ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Data payment = snapshot.data[index];
                    return _createPaymentRow(payment.id, payment.createdOn,
                        payment.amout, payment.type);
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new CircularProgressIndicator();
          },
        ),
        _createPaymentFooter("Pay")
      ]),
    );
  }

  Widget _createtConsumpionList() {
    return SizedBox(
      height: (MediaQuery.of(context).size.height / 2),
      width: 400,
      child: Column(
        children: [
          //_createHeader("#", "Date", "Consumption", "Consumption"),
          // Divider(
          //   height: 1,
          //   thickness: 1,
          // ),
          FutureBuilder<List<Consumption>>(
            future: getConsumptionList(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    Consumption consumption = snapshot.data[index];
                    return _createCard2(consumption.id, consumption.createdOn,
                        consumption.amout, consumption.consumption);
                  },
                );
              } else if (snapshot.hasError) {
                return new Text("${snapshot.error}");
              }
              return new CircularProgressIndicator();
            },
          ),
          //_createPaymentFooter("More")
        ],
      ),
    );
  }

  Future<List<Data>> getPaymentList() async {
    List<Data> paymentList = await IEPaymentServices.getPaymentList();
    return paymentList;
  }

  Future<List<Consumption>> getConsumptionList() async {
    List<Consumption> consumptionList =
        await IEPaymentServices.getConsumptionList();
    return consumptionList;
  }



  Widget _createConsumptionRow(
      String val1, String val2, String val3, String val4) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(val1), Text(val2), Text(val3), Text(val4)]);
  }

  Widget _createTitle(String title, IconData icon) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
      height: 40,
      color: Colors.black12,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.all(5), child: Icon(icon)),
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

  Widget _createPaymentFooter(String title) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(1, 1, 15, 1),
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          ButtonTheme(
            height: 30,
            child: RaisedButton(
                onPressed: () {},
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15),
                )),
          ),
        ]),
      ),
    );
  }

  Widget _createHeader(
      String title1, String title2, String title3, String title4) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title1,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 15),
        ),
        Text(
          title2,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 15),
        ),
        Text(title3,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 15)),
        Text(title4,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black54,
                fontSize: 15))
      ]),
    );
  }

  Widget _createMeterInfo() {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Padding(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 1,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.arrow_back),
                          Text("12223"),
                          Text("4222256")
                        ],
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
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Text("Fllor 1"), Icon(Icons.arrow_forward)],
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget _createPaymentRow(String val1, String val2, String val3, String val4) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(val1), Text(val2), Text(val3), Text(val4)]);
  }

  Widget _addFloorSelection() {
    var widget = Container(
      color: Colors.lightGreen,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [Text("data")],
          ),
          Column(
            children: [
              DropdownButton(
                  value: _value,
                  items: [
                    DropdownMenuItem(
                      child: Text(""),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text(""),
                      value: 2,
                    ),
                    DropdownMenuItem(
                      child: Text(""),
                      value: 3,
                    ),
                    DropdownMenuItem(
                      child: Text(""),
                      value: 4,
                    )
                  ],
                  onChanged: (value) {
                    setState(() {
                      _value = value;
                    });
                  })
            ],
          )
        ],
      ),
    );
    return widget;
  }
} //end of class.

Widget _createCard2(String val1, String val2, String val3, String val4) {
  return Card(
      child: Padding(
    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date: ",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black54,
                  fontSize: 15),
            ),
            Text("Consumtion:",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 15)),
            Text("Reading:",
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    fontSize: 15)),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              val2,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.green,
                  fontSize: 15),
            ),
            Text(val3,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.blueAccent,
                    fontSize: 15)),
            Text(val4,
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    color: Colors.red,
                    fontSize: 15)),
          ],
        ),
      ],
    ),
  ));
}
