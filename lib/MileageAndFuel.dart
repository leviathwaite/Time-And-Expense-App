import 'package:flutter/material.dart';

import 'DateScreen.dart';

// https://docs.google.com/spreadsheets/d/1iidgkhAbLI5Xc899izLIvjUL3kE16vToaax2UAEX6YY/edit#gid=0
// Sheet ID
// 1iidgkhAbLI5Xc899izLIvjUL3kE16vToaax2UAEX6YY

// Current web app URL:
// https://script.google.com/macros/s/AKfycbzfZNQkeGxrBm-dO20VZOw1_9EAjjp-qmaykgxCkZLtu42Hlqg/exec

class MileageAndFuelScreen extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Fuel an Mileage Screen"),
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