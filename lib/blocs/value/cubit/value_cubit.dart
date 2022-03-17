import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'value_state.dart';

class ValueCubit extends Cubit<ValueState> {
  ValueCubit() : super(ValueInitial());
  static ValueCubit get(context) => BlocProvider.of(context);
  int value = 0;

  int getVlue() {
    emit(Value());
    return value;
  }

  void incrementValue() {
    value++;
    print('value from increment = $value');
    emit(ValueIncrementState());
  }

  void decrementValue() {
    if (value > 0) {
      value--;
    }
    emit(ValueDecrementState());
  }

  void setToOne() {
    value = 1;
    emit(ValueToOne());
  }

  void setToTwo() {
    value = 2;
    emit(ValueToTwo());
  }
}
