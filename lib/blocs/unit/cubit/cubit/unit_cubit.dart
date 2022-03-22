import 'package:bloc/bloc.dart';
import 'package:bmi/blocs/value/cubit/value_cubit.dart';
import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'unit_state.dart';

class UnitCubit extends Cubit<UnitState> {
  UnitCubit() : super(UnitInitial());
  static UnitCubit get(context) => BlocProvider.of(context);

  String? unit;

  void setUnit(String v) {
    unit = v;
    emit(ChangeUnitState());
  }
}
