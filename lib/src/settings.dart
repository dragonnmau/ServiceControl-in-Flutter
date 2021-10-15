import 'package:flutter/material.dart';
import 'package:qroomac/src/login.dart';

class settings extends StatefulWidget {
  static String id = "settings";
  settings({Key key}) : super(key: key);

  @override
  _settingsState createState() => _settingsState();
}

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        children: [_buttonExit()],
      )),
    );
  }

  Widget _buttonExit() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          width: 106,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {
                print('Button Clicked.');
                setState(() {
                  //Navigator.pushReplacementNamed(context, HomePage.id);
                  Navigator.pushReplacementNamed(context, loginPage.id);
                });
              },
              textColor: Colors.white,
              color: Colors.red,
              padding: EdgeInsets.fromLTRB(10, 0, 1, 0),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.red,
                        padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                        child: Text(
                          'Salir',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 2, 0),
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ))));
    });
  }
}
