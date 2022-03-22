import 'package:bmi/src/app_root.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'model/ResultSimplePrefrences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ResultSimplePrefrences.init();
  runApp(AppRoot());
}
