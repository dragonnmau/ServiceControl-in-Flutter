import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

final Uint8List kTransparentImage = Uint8List.fromList(<int>[
  0x89,
  0x50,
  0x4E,
  0x47,
  0x0D,
  0x0A,
  0x1A,
  0x0A,
  0x00,
  0x00,
  0x00,
  0x0D,
  0x49,
  0x48,
  0x44,
  0x52,
  0x00,
  0x00,
  0x00,
  0x01,
  0x00,
  0x00,
  0x00,
  0x01,
  0x08,
  0x06,
  0x00,
  0x00,
  0x00,
  0x1F,
  0x15,
  0xC4,
  0x89,
  0x00,
  0x00,
  0x00,
  0x0A,
  0x49,
  0x44,
  0x41,
  0x54,
  0x78,
  0x9C,
  0x63,
  0x00,
  0x01,
  0x00,
  0x00,
  0x05,
  0x00,
  0x01,
  0x0D,
  0x0A,
  0x2D,
  0xB4,
  0x00,
  0x00,
  0x00,
  0x00,
  0x49,
  0x45,
  0x4E,
  0x44,
  0xAE,
]);

class adminPersonal extends StatefulWidget {
  String id = "adminPersonal";
  adminPersonal({Key key}) : super(key: key);

  @override
  _adminPersonalState createState() => _adminPersonalState();
}

class _adminPersonalState extends State<adminPersonal> {
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
                    color: Colors.yellow[100],
                    child: Column(
                      children: [
                        Stack(
                          children: <Widget>[
                            Center(
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: 'https://picsum.photos/100/100/',
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4),
                          child: Column(
                            children: <Widget>[
                              Text('Personal de trabajo'),
                              TextButton(
                                child: const Text('Editar'),
                                onPressed: () {},
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                staggeredTileBuilder: (int index) => StaggeredTile.count(2, 2),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
            ),
          ),
        )));
  }
}
