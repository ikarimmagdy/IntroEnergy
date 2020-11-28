import 'package:flutter/material.dart';
import 'package:intro_energy/ui/commons/ThemeText.dart';
import 'package:intro_energy/ui/screens/dashboard/IESideMenu.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:syncfusion_flutter_charts/charts.dart';

/// Simple pie chart with outside labels example.
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class IEMetersPage extends StatelessWidget {
  static const String routeName = '/meters';
  final List<charts.Series> seriesList;
  final bool animate;

  IEMetersPage({this.seriesList, this.animate});

  /// Creates a [PieChart] with sample data and no transition.
  factory IEMetersPage.withSampleData() {
    return new IEMetersPage(
      seriesList: _createSampleData(),
      animate: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("Meters", style: TextStyle(color: Colors.white)),
        ),
        drawer: IESideMenu(),
        body: ListView(
          children: [
            top(),
            Container(
              color: Colors.lightBlueAccent,
              width: 250,
              height: 250,
              child: _buildChart(),
            ),
            _buildListItem1(),
            _buildListItem2(),
            _buildListItem3()
          ],
        ));
  }

  Widget buildColum() {
    // var size = MediaQuery.of(context).size;
    // /*24 is for notification bar on Android*/
    // final double itemHeight = (size.height - kToolbarHeight - 24) / 4;
    // final double itemWidth = size.width / 2;
    // return Column(children: [
    //   //_buildIcon(),
    //   Expanded(
    //     child: GridView.count(
    //       childAspectRatio: (itemWidth / itemHeight),
    //       crossAxisCount: 2,
    //       children: [
    //         _buildCard("This Month", "1289 KWh", Colors.green),
    //         _buildCard("Reading Date", "27-09-2020", Colors.blueAccent),
    //         _buildCard("Tarrif Step", "1.45 EGP", Colors.red),
    //         _buildCard("Current Balance", "128.08 EGP", Colors.red),
    //         _buildCard("Meter Status", "Connected", Colors.blueAccent),
    //         _buildCard("Tarrif", "Commercial", Colors.red),
    //         _buildCard("Serial", "12345678", Colors.blueAccent),
    //         _buildCard("Address", "Floot 1- Shop A100", Colors.red),
    //       ],
    //     ),
    //   ),
    // ]);
  }

  Widget _buildCard(String title, String value, Color color) {
    return Container(
      width: 150,
      height: 150,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Text(title,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 17,
                        color: Colors.black26))),
            Text(
              value,
              style: TextStyle(
                  fontWeight: FontWeight.normal, fontSize: 20, color: color),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Icon(
      Icons.ac_unit,
      size: 50,
    );
  }

  Widget _buildChart() {
    return new charts.PieChart(seriesList,
        animate: animate,
        // Add an [ArcLabelDecorator] configured to render labels outside of the
        // arc with a leader line.
        //
        // Text style for inside / outside can be controlled independently by
        // setting [insideLabelStyleSpec] and [outsideLabelStyleSpec].
        //
        // Example configuring different styles for inside/outside:
        //       new charts.ArcLabelDecorator(
        //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
        //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
        defaultRenderer: new charts.ArcRendererConfig(arcRendererDecorators: [
          new charts.ArcLabelDecorator(
              labelPosition: charts.ArcLabelPosition.outside)
        ]));
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<LinearSales, int>> _createSampleData() {
    final data = [
      new LinearSales(0, 1),
      new LinearSales(1, 5),
      new LinearSales(5, 8),
      new LinearSales(8, 10),
    ];

    return [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the arc label.
        labelAccessorFn: (LinearSales row, _) => '${row.year}: ${row.sales}',
      )
    ];
  }

  Widget _buildListItem1() {
    var card = Card(
      child: ListTile(
        leading: Icon(
          Icons.add_moderator,
          color: Colors.blueAccent,
        ),
        title: Text(
          "Consumption",
          style: ThemeText.normalTextBlack,
        ),
        subtitle: Text("1289 KWh"),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Step",
              style: ThemeText.normalTextBlack,
            ),
            Text("1.45 EGP")
          ],
        ),
      ),
    );
    return card;
  }

  Widget _buildListItem2() {
    var card = Card(
      child: ListTile(
        leading: Icon(
          Icons.account_balance_wallet,
          color: Colors.green,
        ),
        title: Text(
          "Balance",
          style: ThemeText.normalTextBlack,
        ),
        subtitle: Text("128.08 EGP"),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tariff",
              style: ThemeText.normalTextBlack,
            ),
            Text("Commercial")
          ],
        ),
      ),
    );
    return card;
  }
  Widget _buildListItem3() {
    var card = Card(
      child: ListTile(
        leading: Icon(
          Icons.account_balance_outlined,
          color: Colors.amber,
        ),
        title: Text(
          "Serial",
          style: ThemeText.normalTextBlack,
        ),
        subtitle: Text("123456789"),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Address",
              style: ThemeText.normalTextBlack,
            ),
            Text("Floor 1")
          ],
        ),
      ),
    );
    return card;
  }

  Widget top() {
    var widget = Container(
        color: Colors.green,
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
             Text(
               "Total",
               style: ThemeText.minGray,
             ),
             Text(
               "1289 KWh",
               style: ThemeText.normalTextWight,
             )
           ],),
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
              Text(
                "Date",
                  style: ThemeText.minGray,
              ),
              Text(
                "27-9-2020",
                style: ThemeText.normalTextWight,
              )
            ],)
          ],
        ));
    return widget;
  }
} //end of State Class

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
