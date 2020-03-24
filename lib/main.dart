import 'package:flutter/material.dart';
import 'Form.dart';
import 'form_controller.dart';

// ref tutorial for google sheets
// https://medium.com/mindorks/storing-data-from-the-flutter-app-google-sheets-e4498e9cda5d

// vehicle, mileage, fuelCost
// Google Sheet url
// https://docs.google.com/spreadsheets/d/1iidgkhAbLI5Xc899izLIvjUL3kE16vToaax2UAEX6YY/edit#gid=0
// Sheet ID
// 1iidgkhAbLI5Xc899izLIvjUL3kE16vToaax2UAEX6YY

// TODO curreny input check
// https://www.woolha.com/tutorials/dart-formatting-currency-with-numberformat

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Google Sheet Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Google Sheet Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  // vehicle, mileage, fuelCost
  // TextField Controllers
  TextEditingController vehicleController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController fuelCostController = TextEditingController();

  // Method to Submit Feedback and save it in Google Sheets
  void _submitForm() {
    // Validate returns true if the form is valid, or false
    // otherwise.
    if (_formKey.currentState.validate()) {
      // If the form is valid, proceed.
      // vehicle, mileage, fuelCost
      FeedbackForm feedbackForm = FeedbackForm(
          vehicleController.text,
          mileageController.text,
          fuelCostController.text
      );

      FormController formController = FormController((String response) {
        print("Response: $response");
        if (response == FormController.STATUS_SUCCESS) {
          // Saved successfully in Google Sheets.
          _showSnackbar("Feedback Submitted");
        } else {
          // Error Occurred while saving data in Google Sheets.
          _showSnackbar("Error Occurred!");
        }
      }
      );

      _showSnackbar("Submitting Data");

      // Submit 'feedbackForm' and save it in Google Sheets.
      formController.submitForm(feedbackForm);
    }
  }

  // Method to show snackbar with 'message'.
  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
                key: _formKey,
                child:
                Padding(padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: vehicleController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Valid Vehicle Name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            labelText: 'Vehicle Name'
                        ),
                      ),
                      TextFormField(
                        controller: mileageController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Valid Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: 'Mileage'
                        ),
                      ),
                      TextFormField(
                        controller: fuelCostController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Valid Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: InputDecoration(
                          labelText: 'Fuel Cost',
                        ),
                      ),
                    ],
                  ),
                )
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed:_submitForm,
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }

}