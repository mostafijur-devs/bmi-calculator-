import 'package:bmi_calculator/bmi_provider.dart';
import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiHome extends StatefulWidget {
  const BmiHome({super.key});

  @override
  State<BmiHome> createState() => _BmiHomeState();
}

class _BmiHomeState extends State<BmiHome> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
        child: Consumer<BmiProvider>(
          builder:(context, value, child) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                onChanged: value.getWeight,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Your Weight (in kg)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.scale)),
              ),
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                onChanged: value.getHeight,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Your Height (in meter)',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.scale_outlined)),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OutlinedButton(
                onPressed: () {
                  value.calculateBmi(context);


                },
                child: const Text('CALCULATE'),
              )
            ],
          ),
        ),
      ),
    );
  }


}

showMsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
