import 'package:flutter/material.dart';
import 'package:qroomac/src/adminClientes.dart';
import 'package:qroomac/src/dashboard.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:backdrop/backdrop.dart';
import 'package:qroomac/src/ordenes.dart';
import 'package:qroomac/src/settings.dart';
import 'package:qroomac/src/adminPersonal.dart';

class mAdminPage extends StatefulWidget {
  static String id = "mAdminPage";
  mAdminPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _mAdminPageState();
}

class _mAdminPageState extends State<mAdminPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  static List _kTabPages = <Widget>[
    dashboard(),
    ordenesPage(),
    adminPersonal(),
    clientesPage(),
    settings()
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
                TabItem(icon: Icons.dashboard, title: 'Dashboard'),
                TabItem(icon: Icons.check_box, title: 'Ordenes'),
                TabItem(icon: Icons.supervised_user_circle, title: 'Personal'),
                TabItem(icon: Icons.contact_page, title: 'Clinetes'),
                TabItem(icon: Icons.settings, title: 'Opciones'),
              ],
              initialActiveIndex: 0, //optional, default as 0
              controller: _tabController,
              onTap: (int i) => {},
            )));
  }
}
