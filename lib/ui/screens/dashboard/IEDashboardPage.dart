import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_energy/models/IEPaymentModel.dart';
import 'package:intro_energy/services/IEPaymentServices.dart';
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
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        drawer: IESideMenu(),
        body: _createBody());
  }

  Widget _createCard({String title, String value, String unit}) {
    return SizedBox(
      height: 100,
      width: 195,
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
                                          fontSize: 20),
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
                                          fontSize: 24),
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
    return Column(
      children: [
        Text("Latest Payments"),
        FutureBuilder<List<Data>>(
          future: getPaymentList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Data payment = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      leading: _createcellRow(
                          payment.amout.toString(), payment.type.toString()),
                      trailing: Text(payment.createdOn.toString()),
                    ),
                  );
                },
              );
              ;
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new CircularProgressIndicator();
          },
        )
      ],
    );
  }

  Widget _createtConsumpionList() {
    return Column(
      children: [
        Text("Latest Consumption"),
        FutureBuilder<List<Data>>(
          future: getConsumptionList(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Data payment = snapshot.data[index];
                  return Card(
                    child: ListTile(
                      leading: _createcellRow(payment.amout.toString(), ""),
                      trailing: Text(payment.createdOn.toString()),
                    ),
                  );
                },
              );
              ;
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new CircularProgressIndicator();
          },
        )
      ],
    );
  }

  Future<List<Data>> getPaymentList() async {
    List<Data> paymentList = await IEPaymentServices.getPaymentList();
    return paymentList;
  }

  Future<List<Data>> getConsumptionList() async {
    List<Data> consumptionList = await IEPaymentServices.getConsumptionList();
    return consumptionList;
  }

  Widget _createBody() {
    return Column(
      children: [_createBalance(), _createPaymentList(), _createTarrif(),_createtConsumpionList()],
    );
  }

  Widget _createcellRow(String val1, String val2) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text("Amount:" + val1 + " EGY"), Text("Type:" + val2)]);
  }
}
