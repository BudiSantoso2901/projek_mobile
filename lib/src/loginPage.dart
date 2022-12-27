import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projek_mobile/src/home.dart';
import 'package:projek_mobile/src/homepage.dart';
import 'package:projek_mobile/src/signup.dart';
import 'package:projek_mobile/src/welcomePage.dart';
import 'package:http/http.dart' as http;
import 'Widget/bezierContainer.dart';

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginPage({Key? key, this.title}) : super(key: key);

  final String? title;

  BuildContext get context => context;

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _entryField(
    String title,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: emailController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _password(
    String title,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    loginProcess() async {
      String email = emailController.text;
      String password = passwordController.text;
      Uri url = Uri.parse("http://10.0.2.2:8000/api/login");
      var hasilResponse = await http.post(
        url,
        body: {
          "email": email,
          "password": password,
        },
        headers: {
          "Acceept": "application/json",
        },
      );
      print(hasilResponse.statusCode);
      if (hasilResponse.statusCode == 200) {
/**
* hasilnya adalah {"token":"QpwL5tke4Pnpja7X4"}
*/
        print(hasilResponse.body);
/**
* dilakukan proses decode untuk 
* mendapatkan nilai dari variabel token
*/
        var result = json.decode(hasilResponse.body);
        var token = result['token'];
        print(token);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => homepage(
                  email: email,
                  password: password,
                )));
      } else {
        AlertDialog alert = AlertDialog(
          title: Text("Login Gagal"),
          content: Container(
            child: Text("Cek detail login anda"),
          ),
          actions: [
            TextButton(
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.yellow),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );

        showDialog(context: context, builder: (context) => alert);
        return;
      }
    }

    return Column(
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 10.0)),
        ElevatedButton(
            onPressed: () {
              loginProcess();
            },
            child: Text("login"))
      ],
    );
  }

  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('or'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Don\'t have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Register',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: 'Bahasa Osing Translate',
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0)),
        ));
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryField("Email"),
        _password("Password"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      height: height,
      child: Stack(
        children: <Widget>[
          Positioned(
              top: -height * .10,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: height * .2),
                  _title(),
                  SizedBox(height: 50),
                  _emailPasswordWidget(),
                  SizedBox(height: 20),
                  _submitButton(context),
                  SizedBox(height: 40),
                  _createAccountLabel(),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.centerRight,
                    child: Text('Forgot Password ?',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 40, left: 0, child: _backButton()),
        ],
      ),
    ));
  }
}
