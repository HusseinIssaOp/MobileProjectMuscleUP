import 'package:flutter/material.dart';
import 'user.dart';
import 'result.dart';
import 'type.dart';
//import 'MyTextFieldWidget.dart';

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  //double _x = -1;
  //double _y = -1;
  //String _sum = '';

  final TextEditingController _controllerHours = TextEditingController();
  final TextEditingController _controllerRate = TextEditingController();
  final TextEditingController _controllerTarget = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Type? _selectedType;

  Type mod = typelist.first;
  void updateType(Type mod) {
    setState(() {
      this.mod = mod;
      _selectedType = mod;
    });
  }

  @override
  void dispose() {
    _controllerRate.dispose();
    _controllerHours.dispose();
    _controllerTarget.dispose();
    super.dispose();
  }

  void openResult() {
    try {
      if (_selectedType == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please choose a type'),
          ),
        );
        return; // exit bl 25ir
      }

      int height = int.parse(_controllerHours.text);

      double weight = double.parse(_controllerRate.text);

      double weightT = double.parse(_controllerTarget.text);
      //String get selectedText => selectedType?.toString() ?? "None";
      // coudnt know how
      int selectedTypeValue =
          _selectedType != null ? typelist.indexOf(_selectedType!) + 1 : 0;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Selected Type: ${_selectedType?.toString() ?? "None"}, $selectedTypeValue'),
        ),
      );

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Result(),
          settings: RouteSettings(
              arguments: User(height, weight, weightT, _selectedRadio as double,
                  _selectedRadio2 as double, selectedTypeValue as double))));
    } catch (e) {
      //print(e); // better to remove print in release version
      // i could kept it
    }
  }

  int _selectedRadio = 0;
  int _selectedRadio2 = 0;

  void refreshFields() {
    _controllerHours.clear();
    _controllerRate.clear();
    _controllerTarget.clear();

    setState(() {
      _selectedRadio = 0;
      _selectedRadio2 = 0;
    });

//snack bar learned it
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Text fields and radio buttons cleared!'),
      ),
    );
  }

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter an age.';
    }
    try {
      int age = int.parse(value);
      if (age < 18) {
        return 'Age must be 18 or older.';
      }
    } catch (e) {
      return 'Enter a valid age.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    //use it with pictures width: screenWidth * 0.28
    double screenWidth = MediaQuery.of(context).size.width;

    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 0.8;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MuscleUP'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Call the function to refresh text fields
              refreshFields();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/white.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(children: [
                const SizedBox(height: 30),
                const Text('Height :',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 300,
                  // height: 50,
                  child: TextField(
                      controller: _controllerHours,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'in Cm',
                          prefixIcon: Icon(Icons.height))),
                ),
                const SizedBox(height: 30),
                const Text('Weight :',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 300,
                  // height: 50,
                  child: TextField(
                      controller: _controllerRate,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'in Kg',
                          prefixIcon: Icon(Icons.monitor_weight))),
                ),
                const SizedBox(height: 30.0),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const Text('Age :',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 10.0),
                      SizedBox(
                          width: 300,
                          //height: 100,
                          child: TextFormField(
                            controller: _controllerTarget,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Above 18',
                              prefixIcon: Icon(Icons.track_changes),
                            ),
                            validator: (value) => validateAge(value),
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text('Goal : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                MyDropdownMenuWidget(updatType: updateType),
                const SizedBox(height: 30),
                const Text('Gender : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Radio(
                    value: 1,
                    groupValue: _selectedRadio2,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadio2 = value as int;
                      });
                      // radio buttons 3 values
                    },
                  ),
                  const Text('Male'),
                  Radio(
                    value: 2,
                    groupValue: _selectedRadio2,
                    onChanged: (value) {
                      setState(() {
                        _selectedRadio2 = value as int;
                      });
                    },
                  ),
                  const Text('Female'),
                ]),
                const SizedBox(height: 30),
                const Text('Activity : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: 1,
                      groupValue: _selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          _selectedRadio = value as int;
                        });
                      },
                    ),
                    const Text('Light Activity'),
                    Radio(
                      value: 2,
                      groupValue: _selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          _selectedRadio = value as int;
                        });
                      },
                    ),
                    const Text('Moderate Activity'),
                    Radio(
                      value: 3,
                      groupValue: _selectedRadio,
                      onChanged: (value) {
                        setState(() {
                          _selectedRadio = value as int;
                        });
                      },
                    ),
                    const Text('Very Active'),
                  ],
                ),
                const SizedBox(height: 30),
                //desgin the button by extra desgins from internet
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      openResult();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 8,
                    shadowColor: Colors.white,
                    visualDensity: VisualDensity.standard,
                    tapTargetSize: MaterialTapTargetSize.padded,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: const LinearGradient(
                        colors: [Colors.orange, Colors.deepOrange],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fitness_center, size: 30),
                        SizedBox(width: 5),
                        Text(
                          'Calculate',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                //from slides didnt use them

                /*const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.navigate_before, size: 50))*/

                /*  const SizedBox(height: 50),
                MyTextFieldWidget(hint: 'Enter The value of X', f: updateX),
                const SizedBox(
                  height: 10,
                ),
                MyTextFieldWidget(hint: 'Enter The value of Y', f: updateY),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                    onPressed: () => setState(() {
                          if (_x == -1 || _y == -1) {
                            _sum = 'please fill all fields';
                          } else {
                            _sum = (_x + _y).toString();
                          }
                        }),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .black, 
                    ),
                    child: const Text('Update and SUM',
                        style: TextStyle(
                          fontSize: 18.0,
                        ))),
                Text(
                  'Values of X $_x and Y $_y SUM $_sum',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),*/
              ]),
            ),
          ),
        ],
      ),
    );
  }

  // from slides not used

/*
  updateY(String _Xin) {
    if (_Xin.trim() == '') {
      _x = -1;
    } else {
      _x = double.parse(_Xin);
    }
  }

  updateX(String _Yin) {
    if (_Yin.trim() == '') {
      _y = -1;
    } else {
      _y = double.parse(_Yin);
    }
  }*/
}
