import 'package:bmi/blocs/value/cubit/value_cubit.dart';
import 'package:bmi/components/dropdown_list.dart';
import 'package:bmi/components/gender_determiner.dart';
import 'package:bmi/views/result_screen.dart';
import 'package:flutter/material.dart';
import '../components/Bim_text.dart';
import '../components/value_determiner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  var ageCubit = ValueCubit();
  var weightCubit = ValueCubit();
  var heightCubit = ValueCubit();
  var genderCubit = ValueCubit();
  final weightUnits = ['Kg', 'G', 'Mg'];
  final heightUnits = ['Cm', 'M', 'Km', 'Ft'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 6, 24, 39),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.notifications_outlined,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              BimText('BMI Calculator', 23, FontWeight.w900),
              SizedBox(height: 10),
              BimText('Gender', 12, FontWeight.normal),
              BlocConsumer<ValueCubit, ValueState>(
                listener: (context, state) {},
                builder: (context, state) {
                  return GenderDetrminer(genderCubit);
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
                          weightCubit = ValueCubit.get(context);
                          return ValueDetrminer(weightCubit);
                        },
                      )),
                  Expanded(child: DropdownList(weightUnits)),
                ],
              ),
              SizedBox(height: 30),
              BimText('Height', 10, FontWeight.normal),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: BlocConsumer<ValueCubit, ValueState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          heightCubit = ValueCubit.get(context);
                          return ValueDetrminer(heightCubit);
                        },
                      )),
                  Expanded(child: DropdownList(heightUnits)),
                ],
              ),
              SizedBox(height: 25),
              BimText('Age', 10, FontWeight.normal),
              BlocConsumer<ValueCubit, ValueState>(
                listener: (context, state) {},
                builder: (context, state) {
                  ageCubit = ValueCubit.get(context);
                  return ValueDetrminer(ageCubit);
                },
              ),
              SizedBox(height: 30),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 172, 91, 175),
                  ),
                  onPressed: () {
                    print('height = ${heightCubit.value}');
                    print('weight = ${weightCubit.value}');
                    print('age = ${ageCubit.value}');
                    print(
                        'genger = ${(genderCubit.value) == 1 ? "female" : "male"}');

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                heightCubit.getVlue(),
                                weightCubit.getVlue(),
                                ageCubit.getVlue(),
                                genderCubit.getVlue())),
                        (route) => false);
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
}
