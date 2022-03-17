import 'package:bmi/blocs/value/cubit/value_cubit.dart';
import 'package:flutter/material.dart';

class ValueDetrminer extends StatelessWidget {
  var vCubit;
  ValueDetrminer(this.vCubit);
  int value = 0;

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
              vCubit.decrementValue();
            },
            child: Icon(
              Icons.minimize,
              color: Colors.white,
              size: 15,
            ),
          ),
          Text('${vCubit.value}'),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              vCubit.incrementValue();
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
