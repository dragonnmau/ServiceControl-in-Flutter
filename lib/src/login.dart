import 'package:flutter/material.dart';
import 'package:qroomac/src/mainPersonal.dart';
import 'package:qroomac/src/mainAdmin.dart';

class loginPage extends StatefulWidget {
  static String id = "LoginPage";

  loginPage({Key key}) : super(key: key);

  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  String _user = "";
  String _pass = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Color(0xFFC9BA8B), Color(0xFFE9E9E9)])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: SizedBox(
                      height: 10.0,
                    )),
                    FractionallySizedBox(
                        widthFactor: 0.4,
                        child: Image.asset("assets/img/placeholder.png")),
                    SizedBox(
                      height: 5,
                    ),
                    FractionallySizedBox(
                        widthFactor: 0.9,
                        child: Column(
                          children: [
                            _UserTextField(),
                            SizedBox(
                              height: 10.0,
                            ),
                            _PassTextField(),
                            SizedBox(
                              height: 30.0,
                            ),
                            _LoginButton(),
                            SizedBox(
                              height: 30.0,
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Widget _UserTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: (TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              icon: Icon(Icons.person),
              hintText: "Escriba su usuario",
              labelText: "Usuario"),
          onChanged: (val) {
            _user = val;
          },
        )),
      );
    });
  }

  Widget _PassTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: (TextField(
          keyboardType: TextInputType.emailAddress,
          obscureText: true,
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
              hintText: "Escriba su contraseña",
              labelText: "Contraseña"),
          onChanged: (val) {
            _pass = val;
          },
        )),
      );
    });
  }

  Widget _LoginButton() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
          width: 110,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {
                switch (_user) {
                  case "admin":
                    Navigator.pushReplacementNamed(context, mAdminPage.id);
                    break;

                  case "user":
                    Navigator.pushReplacementNamed(context, mPersonalPage.id);
                    break;

                  case "":
                    _ShowAlert(context, "Ingrese un usuario");
                    break;

                  default:
                    _ShowAlert(context, "Usuario no valido");
                }
              },
              textColor: Colors.white,
              color: Colors.lightGreen[700],
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        color: Colors.lightGreen[700],
                        padding: EdgeInsets.fromLTRB(10, 4, 4, 4),
                        child: Text(
                          'Iniciar Sesión',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ))));
    });
  }

  void _ShowAlert(BuildContext context, String cont) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          title: Text("Alerta"),
          content: Text(cont),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cerrar'))
          ],
        );
      },
    );
  }
}
