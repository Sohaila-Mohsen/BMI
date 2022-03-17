// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:bmi/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../components/Bim_text.dart';
import '../components/chart.dart';

class ResultScreen extends StatelessWidget {
  int? height, weight, age, gender; //1==> female , 2==>male
  double? result;
  String? range, catigory;

  ResultScreen(this.height, this.weight, this.age, this.gender) {
    doCBMICalculations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 6, 24, 39),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      color: Colors.grey.withOpacity(0.6),
                      size: 25,
                    ),
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.grey.withOpacity(0.8),
                      size: 25,
                    ),
                  ],
                ),
              ),
              BimText('Result', 30, FontWeight.w900),
              ChartComponent(),
              Text('For Your Height, a normal weight range would be $range '),
              BimText('For Your Height, a normal weight range would be $range ',
                  13, FontWeight.bold),
              BimText(
                  'Your Bmi is $result, indicating your weight is in the $catigory',
                  13,
                  FontWeight.normal),
              BimText(
                  'Mantaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity',
                  13,
                  FontWeight.normal),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 172, 91, 175),
                  ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (route) => false);
                  },
                  child: BimText('Realculate BMI', 15, FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void doCBMICalculations() {
    //calculate bmi
    result = weight! / pow(height!, 2);

    //calculate range and category
    if (result! < 18.5) {
      range = 'less than or equal${pow(height!, 2) * 18.5}';
      catigory = 'underweight';
    } else if (result! >= 18.5 && result! < 24.9) {
      range =
          'from ${pow(height!, 2) * 18.5} and range = ${pow(height!, 2) * 24.9}';
      catigory = 'normal';
    } else if (result! >= 24.9 && result! < 29.9) {
      range =
          'from ${pow(height!, 2) * 24.9} and range = ${pow(height!, 2) * 29.9}';
      catigory = 'overweight';
    } else {
      range = 'more than or equal ${pow(height!, 2) * 30}';
      catigory = 'obese';
    }
  }
}
