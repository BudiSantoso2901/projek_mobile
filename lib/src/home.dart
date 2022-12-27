import 'package:flutter/material.dart';

class home extends StatefulWidget {
  home();
  @override
  State<home> createState() => new _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: <Color>[
                Colors.blue,
                Colors.purpleAccent,
              ],
            ),
          ),
          padding: new EdgeInsets.all(30.0),
          child: new Column(
            children: <Widget>[
              new TextField(
                maxLines: 5,
                decoration: new InputDecoration(
                    hintText: "Indonesia",
                    labelText: "Indonesia",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0))),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 20.0),
              ),
              new TextField(
                maxLines: 5,
                decoration: new InputDecoration(
                    hintText: "Osing",
                    labelText: "Osing",
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(20.0))),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 120.0),
              ),
              Container(
                width: 100,
                height: 45,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Translate",
                    style: TextStyle(
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
