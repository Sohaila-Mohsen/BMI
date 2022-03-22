// ignore_for_file: unnecessary_new, must_be_immutable

import 'dart:math';

import 'package:bmi/blocs/value/cubit/value_cubit.dart';
import 'package:bmi/views/home_screen.dart';
import 'package:flutter/material.dart';
import '../components/Bim_text.dart';
import '../components/chart.dart';
import '../model/ResultSimplePrefrences.dart';

class ResultScreen extends StatelessWidget {
  ValueCubit? valueCubit; //1==> female , 2==>male
  double? result;
  String? range, catigory;

  ResultScreen(this.valueCubit, {Key? key}) : super(key: key)  {
    doCBMICalculations();
    ResultSimplePrefrences.setBmiResult(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 6, 24, 39),
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
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
              ChartComponent(result),
              Text('For Your Height, a normal weight range would be $range '),
              BimText('For Your Height, a normal weight range would be $range ',
                  13, FontWeight.bold),
              BimText(
                  'Your Bmi is ${result!.toStringAsFixed(1)}, indicating your weight is in the $catigory',
                  13,
                  FontWeight.normal),
              BimText(
                  'Mantaining a healthy weight may reduce the risk of chronic diseases associated with overweight and obesity',
                  13,
                  FontWeight.normal),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 172, 91, 175),
                  ),
                  onPressed: () {
                    valueCubit!.weight = 0;
                    valueCubit!.height = 0;
                    valueCubit!.age = 0;
                    valueCubit!.selected = 0;
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                        (Route<dynamic> route) => false);
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
    result = valueCubit!.weight / pow(valueCubit!.height, 2);

    //calculate range and category
    if (result! < 18.5) {
      range =
          'less than or equal${(pow(valueCubit!.height, 2) * 18.5).toStringAsFixed(1)}';
      catigory = 'underweight';
    } else if (result! >= 18.5 && result! < 24.9) {
      range =
          'from ${(pow(valueCubit!.height, 2) * 18.5).toStringAsFixed(1)} and  ${(pow(valueCubit!.height, 2) * 24.9).toStringAsFixed(1)}';
      catigory = 'normal';
    } else if (result! >= 24.9 && result! < 29.9) {
      range =
          'from ${(pow(valueCubit!.height, 2) * 24.9).toStringAsFixed(1)} and  ${(pow(valueCubit!.height, 2) * 29.9).toStringAsFixed(1)}';
      catigory = 'overweight';
    } else {
      range =
          'more than or equal ${(pow(valueCubit!.height, 2) * 30).toStringAsFixed(1)}';
      catigory = 'obese';
    }
  }
}

