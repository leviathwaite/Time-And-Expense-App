import "package:intl/intl.dart";
import 'package:flutter/services.dart';

class NumericTextFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;

      /*
      NumberFormat
      Add intl to your pubspec.yaml
      dependencies:
      intl: "^0.15.6"
      and import following:
      import "package:intl/intl.dart";
      */
      final f = new NumberFormat("###.###");
      int num = int.parse(newValue.text.replaceAll(f.symbols.GROUP_SEP, ''));
      final newString = f.format(num);
      return new TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}