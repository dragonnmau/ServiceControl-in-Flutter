import 'package:flutter/material.dart';
import 'package:qroomac/src/orderPage.dart';

class ordenesPage extends StatefulWidget {
  ordenesPage({Key key}) : super(key: key);

  @override
  _ordenesPageState createState() => _ordenesPageState();
}

class _ordenesPageState extends State<ordenesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100,
            child: Center(
                child: Container(
              width: 143,
              child: RaisedButton(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  onPressed: () {
                    Navigator.pushNamed(context, orderPage.id);
                  },
                  textColor: Colors.white,
                  color: Colors.greenAccent[700],
                  padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            color: Colors.greenAccent[700],
                            padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                            child: Text(
                              'Crear nueva Orden',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ))),
            )),
          ),
          Flexible(
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListView(
                        children: <Widget>[
                          createCard('', '', context),
                          createCard('', '', context),
                          createCard('', '', context),
                          createCard('', '', context),
                          createCard('', '', context),
                          createCard('', '', context)
                        ],
                      ),
                    ),
                  )))
        ],
      )),
    );
  }

  Widget createCard(String _title, String subt, context) {
    return Center(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.lock_clock),
              title: Text('Orden de trabajo'),
              subtitle: Text('Este es un ejemplo de la orden de trabajo'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('Ver Detalles'),
                  onPressed: () {
                    Navigator.pushNamed(context, orderPage.id);
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
