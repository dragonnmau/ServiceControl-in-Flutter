import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class clientesPage extends StatefulWidget {
  clientesPage({Key key}) : super(key: key);

  @override
  _clientesPageState createState() => _clientesPageState();
}

class _clientesPageState extends State<clientesPage> {
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
                        title: Text('Cliente'),
                        subtitle: Text('Descripcion de cliente'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('Editar'),
                            onPressed: () {},
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

  Widget createCardTable(String title, IconData icon, Color color) {
    return LayoutBuilder(
        builder: (context, constraints) =>
            Card(color: color, child: Text('hola')));
  }
}
