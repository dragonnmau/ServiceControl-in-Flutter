import 'package:flutter/material.dart';
import 'package:qroomac/src/misOrdenes.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:backdrop/backdrop.dart';
import 'package:qroomac/src/settings.dart';

class mPersonalPage extends StatefulWidget {
  static String id = "mPersonalPage";
  mPersonalPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _mPersonalPageState();
}

class _mPersonalPageState extends State<mPersonalPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  static List _kTabPages = <Widget>[
    misOrdenes(),
    settings(),
  ];

  List<TabItem<dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _kTabPages.length,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width - 100,
        height: 50,
        child: Scaffold(
            body: TabBarView(
              controller: _tabController,
              children: _kTabPages,
            ),
            bottomNavigationBar: ConvexAppBar(
              style: TabStyle.reactCircle,
              backgroundColor: Color(0xFF4CAF50),
              items: [
                TabItem(icon: Icons.check_box, title: 'Mis Ordenes'),
                TabItem(icon: Icons.settings, title: 'Opciones'),
              ],
              initialActiveIndex: 0, //optional, default as 0
              controller: _tabController,
              onTap: (int i) => {},
            )));
  }
}
