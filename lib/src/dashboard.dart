import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class dashboard extends StatefulWidget {
  dashboard({Key key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              child:
                  createCardchart("Monitoreo", Icons.today, Colors.transparent),
            ),
            CreateBut(),
          ],
        ),
      ),
    );
  }

  Widget gridChart() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(children: <Widget>[
        StaggeredGridView.count(
          crossAxisCount: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          children: [createCard('Test', Colors.indigo[100])],
          staggeredTiles: [
            StaggeredTile.extent(1, 310),
          ],
        ),
      ]),
      //
    );
  }

  Widget CreateBut() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: StaggeredGridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            staggeredTiles: [
              StaggeredTile.extent(1, 310),
              StaggeredTile.extent(1, 150),
              StaggeredTile.extent(1, 150),
              StaggeredTile.extent(2, 200),
            ],
            children: [
              createCard('', Colors.indigo[100]),
              createCard('', Colors.indigo[100]),
              createCard('', Colors.indigo[100]),
              createCard('', Colors.indigo[100])
            ],
          ),
        ),
      ),
    );
  }

  Widget createCard(String title, Color color) {
    return LayoutBuilder(
        builder: (context, constraints) => Card(
              color: color,
              child: ((Text(title))),
            ));
  }

  Widget createCardchart(String title, IconData icon, Color color) {
    /// Create one series with sample hard coded data.
    List<charts.Series<LinearSales, int>> _createSampleData() {
      final myFakeDesktopData = [
        new LinearSales(0, 40),
        new LinearSales(1, 25),
        new LinearSales(2, 100),
        new LinearSales(3, 75),
      ];

      var myFakeTabletData = [
        new LinearSales(0, 10),
        new LinearSales(1, 50),
        new LinearSales(2, 200),
        new LinearSales(3, 150),
      ];

      var myFakeMobileData = [
        new LinearSales(0, 105),
        new LinearSales(1, 75),
        new LinearSales(2, 300),
        new LinearSales(3, 25),
      ];

      return [
        new charts.Series<LinearSales, int>(
          id: 'Desktop',
          colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeDesktopData,
        ),
        new charts.Series<LinearSales, int>(
          id: 'Tablet',
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeTabletData,
        ),
        new charts.Series<LinearSales, int>(
          id: 'Mobile',
          colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
          domainFn: (LinearSales sales, _) => sales.year,
          measureFn: (LinearSales sales, _) => sales.sales,
          data: myFakeMobileData,
        ),
      ];
    }

    return LayoutBuilder(
        builder: (context, constraints) => Card(
              color: color,
              child: Column(
                children: [
                  Expanded(
                    child: charts.LineChart(_createSampleData(),
                        defaultRenderer: new charts.LineRendererConfig(
                            includeArea: true, stacked: false),
                        animate: true),
                  )
                ],
              ),
            ));
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
