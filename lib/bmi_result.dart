import 'package:bmi_calculator/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({
    super.key,
    // required this.bmi,
  });

  // final double bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: SingleChildScrollView(
        child: Consumer<BmiProvider>(
          builder:(context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Your BMI',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.grey,
                ),
              ),
              Consumer<BmiProvider>(
                builder: (context, value, child) => Text(
                  value.bmi.toStringAsFixed(2),
                  // bmi.toStringAsFixed(1),
                  style: const TextStyle(fontSize: 48.0),
                ),
              ),
              const Text(
                'You are',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.grey,
                ),
              ),
              Text(
                value.getBmiStatus(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                ),
              ),
              const Text(
                'BMI Table',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.grey,
                ),
              ),
              Column(
                children: [
                  for (final key in bmiStatusMap.keys)
                    ListTile(
                      tileColor: value.getTileColor(key),
                      title: Text(key),
                      trailing: Text(
                        '${bmiStatusMap[key]}',
                        style: const TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const underweightSevere = 'Underweight\n(Severe thinness)';
const underweightModerate = 'Underweight\n(Moderate thinness)';
const underweightMild = 'Underweight\n(Mild thinness)';
const normal = 'Normal Range';
const preObese = 'Overweight\n(Pre-obese)';
const obese1 = 'Obese\n(Class I)';
const obese2 = 'Obese\n(Class II)';
const obese3 = 'Obese\n(Class III)';

final bmiStatusMap = {
  underweightSevere: 'less than 16.0',
  underweightModerate: '16.0 - 16.9',
  underweightMild: '17.0 - 18.4',
  normal: '18.5 - 24.9',
  preObese: '25.0 - 29.9',
  obese1: '30.0 - 34.9',
  obese2: '35.0 - 39.9',
  obese3: '40.0 and up'
};
