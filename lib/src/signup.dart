import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projek_mobile/src/Widget/bezierContainer.dart';
import 'package:projek_mobile/src/loginPage.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordconfirmationController =
      TextEditingController();
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  BuildContext get context => context;

  Widget _backButton() {
    return InkWell(
      onLongPress: () {
        Navigator.canPop(context);
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

  Widget _username(String title, {bool isPassword = false}) {
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
              controller: nameController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _email(
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

  Widget _password(String title, {bool isPassword = false}) {
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
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _passwordconfirmation(String title, {bool isPassword = false}) {
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
              controller: passwordconfirmationController,
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Color.fromARGB(255, 72, 102, 251),
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
      text: TextSpan(text: '', children: [
        TextSpan(
          text: 'Bahasa Osing Translate',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _username("Username"),
        _email("Email"),
        _password("Password", isPassword: true),
        _passwordconfirmation("Password Confirmation", isPassword: true),
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
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(context),
                    SizedBox(height: height * .14),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext context) {
    register() async {
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      String password_confirmation = passwordconfirmationController.text;
      Uri url = Uri.parse("http://10.0.2.2:8000/api/register");
      var hasilResponse = await http.post(
        url,
        body: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": password_confirmation,
        },
        headers: {
          "Acceept": "application/json",
        },
      );
      print(hasilResponse.statusCode);
      if (hasilResponse.statusCode == 201) {
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

        AlertDialog alert = AlertDialog(
          title: Text("Register Berhasil"),
          content: Container(
            child: Text("Selamat anda sudah berhasil register!"),
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
      } else {
        AlertDialog alert = AlertDialog(
          title: Text("Register Gagal"),
          content: Container(
            child: Text("Cek koneksi anda"),
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
              register();
            },
            child: Text("register"))
      ],
    );
  }
}
