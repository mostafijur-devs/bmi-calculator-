
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'bmi_home.dart';
import 'bmi_result.dart';

class BmiProvider extends ChangeNotifier {

  double _weight = 0;
  double _height = 0;
  double _bmi = 0;

  double get weight => _weight;
  double get height => _height;
  double get bmi => _bmi;

  void getWeight(String weight){
    _weight = double.parse(weight);
    notifyListeners();
  }
  void getHeight(String height){
    _height = double.parse(height)*2.54/100;
    notifyListeners();
  }

  String getBmiStatus() {
    if (bmi < 16.0) return underweightSevere;
    if (bmi >= 16.0 && bmi <= 16.9) return underweightModerate;
    if (bmi >= 17.0 && bmi <= 18.4) return underweightMild;
    if (bmi >= 18.5 && bmi <= 24.9) return normal;
    if (bmi >= 25.0 && bmi <= 29.9) return preObese;
    if (bmi >= 30.0 && bmi <= 34.9) return obese1;
    if (bmi >= 35.0 && bmi <= 39.9) return obese2;
    return obese3;
  }

  Color? getTileColor(String status) {
    if( getBmiStatus() == status ) return Colors.grey;
    return null;
  }

  void calculateBmi( BuildContext context) {
    if (weight <= 0) {
      showMsg(context, 'Please provide your weight');
      return;
    }
    if (height <= 0) {
      showMsg(context, 'Please provide your height');
      return;
    }
   _bmi = weight / (height * height);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BmiResult()),
    );

    //showMsg(context, bmi.toStringAsFixed(1));
  }

}