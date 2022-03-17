import 'package:flutter/material.dart';

class BimText extends StatelessWidget {
  String? text;
  double? textSize;
  var textWeight;


  BimText(this.text, this.textSize, this.textWeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,top: 10,bottom: 10),

      child: Text(text!,
        style: TextStyle(
          color: Colors.white,
          fontSize: textSize!,
          fontWeight: textWeight ,
        ),
      ),
    );
  }
}
