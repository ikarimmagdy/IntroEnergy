import 'package:flutter/material.dart';
import 'package:intro_energy/ui/commons/ThemeText.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class IEHistoryPage extends StatefulWidget {
  static const String routeName = '/history';


  @override
  IEHistoryPageState createState() => IEHistoryPageState.withSampleData();


}

class IEHistoryPageState extends State<IEHistoryPage>
    with SingleTickerProviderStateMixin {
  final List<charts.Series> seriesList;
  final bool animate;

  TabController tabController;
  IEHistoryPageState({this.seriesList, this.animate});
  factory IEHistoryPageState.withSampleData() {
    return new IEHistoryPageState(
      seriesList: _createSampleData(),
      animate: true,
    );
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: SafeArea(
            child:  getTabBar(),
          ),
        ),
        body: getTabBarPages());
  }

  Widget oldWidget() {
    return ListView(
      children: [
        Container(
          color: Colors.lightBlueAccent,
          width: 250,
          height: 250,
          child: _buildChart(),
        ),
        _buildListItem1(),
        _buildListItem1(),
        _buildListItem1()
      ],
    );
  }

  Widget getTabBar() {
    return TabBar(controller: tabController, tabs: [
      Tab(text: "3 MONTHS",),
      Tab(text: "6 MONTHS",),
      Tab(text: "12 MONTHS",),
    ]);
  }

  Widget getTabBarPages() {
    return TabBarView(controller: tabController, children: <Widget>[
      oldWidget(),
      oldWidget(),
      oldWidget(),
    ]);
  }


  Widget _buildChart() {
    return new charts.BarChart(
      seriesList,
      animate: animate,
    );
  }

  /// Create one series with sample hard coded data.
  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('11', 5),
      new OrdinalSales('10', 25),
      new OrdinalSales('9', 100),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
    ];
  }


  Widget _buildListItem1() {
    var card = Card(
      child: ListTile(
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "03",
              style: ThemeText.normalTextBlack,
            ),
            Text("NOV", style: ThemeText.minGray)
          ],
        ),
        title: Text(
          "Main Center",
          style: ThemeText.normalTextBlack,
        ),
        subtitle: Text("Sr.2009202000001", style: ThemeText.minGray),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "- EGP 700.00",
              style: ThemeText.normalTextBlack,
            ),
            Text("Cash", style: ThemeText.minGray)
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
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total",
                  style: ThemeText.minGray,
                ),
                Text(
                  "1289 KWh",
                  style: ThemeText.normalTextWight,
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Date",
                  style: ThemeText.minGray,
                ),
                Text(
                  "27-9-2020",
                  style: ThemeText.normalTextWight,
                )
              ],
            )
          ],
        ));
    return widget;
  }


} //end of State Class

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
