import 'package:flutter/material.dart';

class Type {
  String name;
  Type(this.name);
  //to string
  @override
  String toString() {
    return name;
  }
}

class MyDropdownMenuWidget extends StatefulWidget {
  const MyDropdownMenuWidget({required this.updatType, super.key});

  final Function(Type) updatType;

  @override
  State<MyDropdownMenuWidget> createState() => _MyDropdownMenuWidgetState();
}

//alone
List<Type> typelist = [
  Type('Maintain Weight'),
  Type('Lose Weight'),
  Type('Gain Weight')
];

class _MyDropdownMenuWidgetState extends State<MyDropdownMenuWidget> {
  Type? _selectedType;

  Type? get selectedType => _selectedType;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Type>(
      value: _selectedType,
      onChanged: (mod) {
        setState(() {
          widget.updatType(mod!);
          _selectedType = mod;
        });
      },
      items: [
        const DropdownMenuItem(
          value: null,
          child: Text(
            'Select Type', // this is the label gave him index 0
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        // how to add a label
        ...typelist.map<DropdownMenuItem<Type>>((Type mod) {
          return DropdownMenuItem(value: mod, child: Text(mod.toString()));
        }).toList(),
      ],
    );
  }

  /*@override
  String getSelectedName() {
    return selectedType?.name ?? '';
  }*/

  // type not string
  Type? getSelectedType() {
    return _selectedType;
  }
}
