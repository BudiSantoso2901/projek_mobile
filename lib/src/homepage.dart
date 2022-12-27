import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projek_mobile/src/Widget/profile.dart';
import 'package:projek_mobile/src/home.dart';
import 'package:projek_mobile/src/search.dart';

class homepage extends StatelessWidget {
  const homepage({Key? key, required String email, required String password});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApplication(),
    );
  }
}

class MyApplication extends StatefulWidget {
  const MyApplication({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {
  int _selectedItem = 0;

  _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  List<Widget> WidgetPages = <Widget>[home(), search(), profile()];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Translate"),
        backgroundColor: Colors.teal,
      ),
      body: WidgetPages.elementAt(_selectedItem),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
