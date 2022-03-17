import 'package:flutter/material.dart';

import '../blocs/value/cubit/value_cubit.dart';

// ignore: must_be_immutable
class GenderDetrminer extends StatelessWidget {
  ValueCubit valueCubit;
  int selected = 0;

  GenderDetrminer(this.valueCubit, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: IconButton(
              icon: Icon(
                Icons.female_rounded,
                size: 70,
                color: Colors.white,
              ),
              onPressed: () {
                valueCubit.setToOne();
                selected = valueCubit.value;
                print('selected index = ${valueCubit.value}');
              },
            ),
          ),
          Positioned(
            bottom: 100,
            left: 110,
            child: Radio<int>(
              value: 1,
              groupValue: selected,
              onChanged: (value) {
                valueCubit.setToOne();
                selected = valueCubit.value;
              },
            ),
          ),
        ],
      ),
      Stack(
        children: [
          Container(
            height: 140,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: IconButton(
              icon: Icon(
                Icons.male,
                size: 70,
                color: Colors.white,
              ),
              onPressed: () {
                valueCubit.setToTwo();
                selected = valueCubit.value;
                print('selected index = ${selected}');
              },
            ),
          ),
          Positioned(
            bottom: 100,
            left: 110,
            child: Radio<int>(
              value: 2,
              groupValue: selected,
              onChanged: (value) {
                valueCubit.setToTwo();
                selected = valueCubit.value;
              },
            ),
          ),
        ],
      ),
    ]);
  }
}
