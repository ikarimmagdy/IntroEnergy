import 'package:flutter/material.dart';
import 'package:intro_energy/ui/commons/ThemeText.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class IEConsumptionPage extends StatefulWidget {
  static const String routeName = '/consumption';


  @override
  IEConsumptionPageState createState() => IEConsumptionPageState.withSampleData();


}

class IEConsumptionPageState extends State<IEConsumptionPage>
    with SingleTickerProviderStateMixin {
  final List<charts.Series> seriesList;
  final bool animate;

  TabController tabController;
  IEConsumptionPageState({this.seriesList, this.animate});
  factory IEConsumptionPageState.withSampleData() {
    return new IEConsumptionPageState(
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
      barGroupingType: charts.BarGroupingType.grouped,
      // Add the series legend behavior to the chart to turn on series legends.
      // By default the legend will display above the chart.
      behaviors: [new charts.SeriesLegend()],
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('10', 50),
      new OrdinalSales('09', 200),
      new OrdinalSales('08', 10),
    ];

    final tabletSalesData = [
      new OrdinalSales('10', 25),
      new OrdinalSales('09', 50),
      new OrdinalSales('08', 10),
    ];


    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Consumption',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Cost',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tabletSalesData,
      ),
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
          "524 KWh",
          style: ThemeText.normalTextBlack,
        ),
        subtitle: Text("01:2040", style: ThemeText.minGray),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "EGP 700.00",
              style: ThemeText.normalTextBlack,
            ),
            //Text("Cash", style: ThemeText.minGray)
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
