import 'package:flutter_bloc/flutter_bloc.dart';
part 'value_state.dart';

class ValueCubit extends Cubit<ValueState> {
  ValueCubit() : super(ValueInitial());
  static ValueCubit get(context) => BlocProvider.of(context);
  double height = 0.0;
  double weight = 0.0;
  int age = 0;
  int selected = 0;

  /*getVlue() {
    emit(Value());
    return value;
  }*/

  multiplayHeightBy(double m) {
    height *= m;
    emit(MultiplayValueState());
  }

  multiplayWeightBy(double m) {
    weight *= m;
    emit(MultiplayValueState());
  }

  void incrementHeight() {
    height += 1.0;
    print('height from increment = $height');
    emit(HeightIncrementState());
  }

  void incrementWeight() {
    weight += 1.0;
    print('weight from increment = $weight');
    emit(WeightIncrementState());
  }

  void incrementAge() {
    age += 1;
    print('age from increment = $age');
    emit(AgeIncrementState());
  }

  void decrementHeight() {
    if (height > 0) {
      height -= 1.0;
    }
    emit(HeightDecrementState());
  }

  void decrementWeight() {
    if (weight > 0) {
      weight -= 1.0;
    }
    emit(WeightDecrementState());
  }

  void decrementAge() {
    if (age > 0) {
      age -= 1;
    }
    emit(AgeDecrementState());
  }

  void setToOne() {
    selected = 1;
    emit(SelectedToOne());
  }

  void setToTwo() {
    selected = 2;
    emit(SelectedToTwo());
  }
}
