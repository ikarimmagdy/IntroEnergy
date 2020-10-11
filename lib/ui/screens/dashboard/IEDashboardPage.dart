import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_energy/models/IEConsumptionModel.dart';
import 'package:intro_energy/models/IEPaymentModel.dart';
import 'package:intro_energy/services/IEPaymentServices.dart';
import 'package:intro_energy/ui/screens/consumtions/IEConsumptionsPage.dart';
import 'IESideMenu.dart';

class IEDashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';
  @override
  State<StatefulWidget> createState() {
    return _DashboardPageState();
  }
}

class _DashboardPageState extends State<IEDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        drawer: IESideMenu(),
        body: _createBody());
  }

  Widget _createCard({String title, String value, String unit}) {
    return SizedBox(
      height: 75,
      width: (MediaQuery.of(context).size.width/2)-10,
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
                                          color: Colors.lightGreen,
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
                                          fontSize: 20),
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
      height: (MediaQuery.of(context).size.height/2),
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
                        return _createCard2(consumption.id,consumption.createdOn,consumption.amout,consumption.consumption);
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

  Widget _createBody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(children: [
          _createTitle("Meter Info"),
          _createMeterInfo(),
          _createTitle("Latest Payments"),
          _createBalance(),
          _createPaymentList(),
          _createTitle("Latest Consumptions"),
          _createTarrif(),
          _createtConsumpionList()
        ]),
      ),
    );
  }

  Widget _createConsumptionRow(
      String val1, String val2, String val3, String val4) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(val1), Text(val2), Text(val3), Text(val4)]);
  }

  Widget _createTitle(String title) {
    return Container(
      height: 30,
      color: Colors.black12,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0,0,5,0),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.all(5), child: Icon(Icons.payment)),
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
                fontWeight: FontWeight.bold, color: Colors.black54, fontSize: 15))
      ]),
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

  Widget _createPaymentRow(String val1, String val2, String val3, String val4) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(val1), Text(val2), Text(val3), Text(val4)]);
  }
} //end of class.
Widget _createCard2(String val1, String val2, String val3, String val4) {
  return Card(
      child: Padding(
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Date: ",style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black26,
                  fontSize: 18),
              ),
              Text("Consumtion:",style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black26,
                  fontSize: 18)),
              Text("Reading:",style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.black26,
                  fontSize: 18)),
            ],),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(val2,style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.green,
                  fontSize: 18),
              ),
              Text(val3,style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.blueAccent,
                  fontSize: 18)),
              Text(val4,style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                  fontSize: 18)),
            ],),
          ],),
      )
  );
}