import 'package:flutter/material.dart';

class Type {
  String name;

  // determines if car is insured, default is false
  // constructor only takes model and price. warranty and insurance are set later
  Type(this.name);
  // toString method used to display an item in a dropdown widget
  @override
  String toString() {
    return name;
  }
}

class MyDropdownMenuWidget extends StatefulWidget {
  const MyDropdownMenuWidget({required this.updatType, super.key});
// below is a callback function to return the selected car to the home page
// we will call it from the widget’s state class
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
  Type? selectedType;
/*
class to represent a dropdown of cars.
It is populated using the cars list.
It contains a callback function called updateCar to pass the selected car back
to the home page.
 */
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 210.0,
        initialSelection: typelist[0], // first car to be displayed
        onSelected: (mod) {
          setState(() {
            widget.updatType(mod as Type);
            selectedType = mod;
            Text(selectedType.toString());
            // use widget to access widget fields from state class
          });
        },
        // the list map function converts the list of cars to a list of DropdownMenuEntries
        dropdownMenuEntries: typelist.map<DropdownMenuEntry<Type>>((Type mod) {
          return DropdownMenuEntry(value: mod, label: mod.toString());
        }).toList());
  }

  /*@override
  String getSelectedName() {
    return selectedType?.name ?? '';
  }*/
  Type? getSelectedType() {
    return selectedType;
  }
}
