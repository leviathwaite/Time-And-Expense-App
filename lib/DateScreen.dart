import 'package:flutter/material.dart';

import 'TimeScreen.dart';

class DateScreen extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Date Screen"),
        ),
        body: new Checkbox(
            value: false,
            onChanged: (bool newValue) {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new TimeScreen()),
              );
            }
        )
    );
  }
}