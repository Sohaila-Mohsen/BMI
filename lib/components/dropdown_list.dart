import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropdownList extends StatefulWidget {
  final List<String> units;

  DropdownList(this.units ){value=units[0];}

  String? value ;

  @override
  State<DropdownList> createState() => _DropdownListState();
}

class _DropdownListState extends State<DropdownList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      height: 50,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(right: 20),
      child: DropdownButton<String>(
        icon: Icon(Icons.keyboard_arrow_down_sharp),
        isExpanded: true,
        value: widget.value,
        items: widget.units.map(buildMenueItem).toList(),
        onChanged: (value) => setState(() {
          widget.value = value;
        }),
      ),
    );
  }

  DropdownMenuItem<String> buildMenueItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontSize: 15, decoration: TextDecoration.none),
        ),
      );
}
