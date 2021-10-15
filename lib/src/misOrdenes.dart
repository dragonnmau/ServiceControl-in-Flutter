import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:qroomac/src/orderPage.dart';
import 'package:qroomac/src/orderPageUser.dart';

class misOrdenes extends StatefulWidget {
  static String id = "misOrdenes";
  misOrdenes({Key key}) : super(key: key);

  @override
  _misOrdenesState createState() => _misOrdenesState();
}

class _misOrdenesState extends State<misOrdenes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal[700],
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: StaggeredGridView.countBuilder(
                crossAxisCount: 4,
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) => Container(
                  color: Colors.green[100],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        title: Text('Orden de trabajo'),
                        subtitle: Text('Descripcion de la orden de trabajo'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Ver detalles'),
                            onPressed: () {
                              Navigator.pushNamed(context, orderPageUser.id);
                            },
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
                staggeredTileBuilder: (int index) =>
                    StaggeredTile.count(4, 1.5),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            ),
          ),
        )));
  }
}
