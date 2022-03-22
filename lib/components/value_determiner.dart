import 'package:bmi/blocs/value/cubit/value_cubit.dart';
import 'package:flutter/material.dart';

class ValueDetrminer extends StatelessWidget {
  ValueCubit vCubit;
  ValueDetrminer(this.vCubit, this.type, {Key? key}) : super(key: key);
  String? type, value = '0';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.white,
      ),
      height: 50,
      margin: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              if (type == 'Height') {
                vCubit.decrementHeight();
                print('value = ${vCubit.height}');
                value = vCubit.height.toString();
                print('value a = $value');
              } else if (type == 'Weight') {
                vCubit.decrementWeight();
                value = vCubit.weight.toString();
                print(value);
              } else if (type == 'Age') {
                vCubit.decrementAge();
                value = vCubit.age.toString();
              }
            },
            child: Icon(
              Icons.minimize,
              color: Colors.white,
              size: 15,
            ),
          ),
          Text(type == 'Height'
              ? '${vCubit.height}'
              : type == 'Weight'
                  ? '${vCubit.weight}'
                  : '${vCubit.age}'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              if (type == 'Height') {
                vCubit.incrementHeight();
                value = vCubit.height.toString();
              } else if (type == 'Weight') {
                vCubit.incrementWeight();
                value = vCubit.weight.toString();
              } else if (type == 'Age') {
                vCubit.incrementAge();
                value = vCubit.age.toString();
              }
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 15,
            ),
            //color: Colors.black,
          ),
        ],
      ),
    );
  }
}
