import 'package:bmi/blocs/unit/cubit/cubit/unit_cubit.dart';
import 'package:bmi/blocs/value/cubit/value_cubit.dart';
import 'package:bmi/components/dropdown_list.dart';
import 'package:bmi/components/gender_determiner.dart';
import 'package:bmi/views/result_screen.dart';
import 'package:flutter/material.dart';
import '../components/Bim_text.dart';
import '../components/value_determiner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/ResultSimplePrefrences.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  var valueCubit = ValueCubit();
  var weightUnitCubit = UnitCubit();
  var heightUnitCubit = UnitCubit();
  final weightUnits = ['Kg', 'G', 'Mg'];
  final heightUnits = ['Cm', 'M', 'Km', 'Ft'];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 6, 24, 39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container( 
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    const Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Text(ResultSimplePrefrences.getBMIResult() != null? 'Your Last BMI is ${ResultSimplePrefrences.getBMIResult()}':'Hello!'),
              ),
              const SizedBox(height: 15),
              BimText('BMI Calculator', 23, FontWeight.w900),
              const SizedBox(height: 10),
              BimText('Gender', 12, FontWeight.normal),
              BlocConsumer<ValueCubit, ValueState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return GenderDetrminer(valueCubit);
                },
              ),
              BimText('Weight', 10, FontWeight.normal),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: BlocConsumer<ValueCubit, ValueState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          valueCubit = ValueCubit.get(context);
                          return ValueDetrminer(valueCubit, 'Weight');
                        },
                      )),
                  Expanded(child: DropdownList(weightUnits, weightUnitCubit)),
                ],
              ),
              const SizedBox(height: 30),
              BimText('Height', 10, FontWeight.normal),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: BlocConsumer<ValueCubit, ValueState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          valueCubit = ValueCubit.get(context);
                          return ValueDetrminer(valueCubit, 'Height');
                        },
                      )),
                  Expanded(child: DropdownList(heightUnits, heightUnitCubit)),
                ],
              ),
              const SizedBox(height: 25),
              BimText('Age', 10, FontWeight.normal),
              BlocConsumer<ValueCubit, ValueState>(
                listener: (context, state) {},
                builder: (context, state) {
                  valueCubit = ValueCubit.get(context);
                  return ValueDetrminer(valueCubit, 'Age');
                },
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 172, 91, 175),
                  ),
                  onPressed: () {
                    convertHeightToMeter();
                    convertWeightToKg();
                    print('height = ${valueCubit.height}');
                    print('weight = ${valueCubit.weight}');
                    print('age = ${valueCubit.age}');
                    print(
                        'genger = ${(valueCubit.selected) == 1 ? "female" : "male"}');
                    print('w unit = ${weightUnitCubit.unit}');
                    print('w unit = ${heightUnitCubit.unit}');
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(valueCubit)),
                        (Route<dynamic> route) => false);
                  },
                  child: BimText('Calculate', 15, FontWeight.w300),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void convertHeightToMeter() {
    String? unit = heightUnitCubit.unit;
    if (unit == 'Cm') {
      valueCubit.multiplayHeightBy(0.01);
    } else if (unit == 'KM') {
      valueCubit.multiplayHeightBy(1000);
    } else if (unit == 'Ft') {
      valueCubit.multiplayHeightBy(0.3048);
    }
  }

  void convertWeightToKg() {
    String? unit = weightUnitCubit.unit;
    if (unit == 'g') {
      valueCubit.weight *= 1000;
    } else if (unit == 'Mg') {
      valueCubit.weight *= 0.001;
    }
  }
}
