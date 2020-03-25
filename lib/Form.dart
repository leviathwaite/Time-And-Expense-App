/// FeedbackForm is a data class which stores data fields of Feedback.
class FeedbackForm {
  String _vehicle;
  String _mileage;
  String _fuelCost;
  // vehicle, mileage, fuelCost
  FeedbackForm(this._vehicle, this._mileage, this._fuelCost);

  String printAsString()
  {
    return _vehicle.toString() + " " + _mileage.toString() + " " + _fuelCost.toString();
  }

  // Method to make GET parameters.
  // String toParams() =>
  String toParams() 
  {
    print("?vehicle=$_vehicle&mileage=$_mileage&fuelCost=$_fuelCost");
    return "?vehicle=$_vehicle&mileage=$_mileage&fuelCost=$_fuelCost";
  }
}

// vehicle slot
// https://docs.google.com/spreadsheets/d/1iidgkhAbLI5Xc899izLIvjUL3kE16vToaax2UAEX6YY/edit#gid=0&range=A:A

// mileage slot
// https://docs.google.com/spreadsheets/d/1iidgkhAbLI5Xc899izLIvjUL3kE16vToaax2UAEX6YY/edit#gid=0&range=B1

// fuelcost slot
//