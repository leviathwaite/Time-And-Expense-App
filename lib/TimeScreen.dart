import 'package:flutter/material.dart';

import 'DateScreen.dart';

class TimeScreen extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Time Screen"),
        ),
        body: new Checkbox(
            value: false,
            onChanged: (bool newValue) {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new DateScreen()),
              );
            }
        ),

    );
  }

}