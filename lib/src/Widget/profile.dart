import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  const profile();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundColor: Colors.amber,
            child: CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
          ),
          SizedBox(height: 30),
          Text("ACHMAD BAGUS FADILAH",
              style: TextStyle(
                  fontFamily: 'fontPoppins',
                  fontSize: 25,
                  color: Colors.blue,
                  fontWeight: FontWeight.w700)),
          SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("WhatsApp : 082132623415",
                  style: TextStyle(fontFamily: 'fontPoppins', fontSize: 15)),
              Text("Instagram : @fadiiill_",
                  style: TextStyle(fontFamily: 'fontPoppins', fontSize: 15)),
              Text("Email : bagusfadilah05@gmail.com",
                  style: TextStyle(fontFamily: 'fontPoppins', fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }
}
