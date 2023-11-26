import 'package:flutter/material.dart';
import 'user.dart';
import 'result.dart';
import 'type.dart';
import 'MyTextFieldWidget.dart';

class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  double _x = -1;
  double _y = -1;
  String _sum = '';
  final TextEditingController _controllerHours = TextEditingController();
  final TextEditingController _controllerRate = TextEditingController();
  final TextEditingController _controllerTarget = TextEditingController();

  Type mod = typelist.first;
  void updateType(Type mod) {
    // updates car price when the user selects a car form the dropdown
    setState(() {
      this.mod = mod;
      //totalPrice = car.getTotalPrice();
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
      int height = int.parse(_controllerHours.text);

      double weight = double.parse(_controllerRate.text);

      double weightT = double.parse(_controllerTarget.text);

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Result(),

// we send data using the settings and pass to it an Employee object

          settings: RouteSettings(
              arguments:
                  User(height, weight, weightT, _selectedRadio as double))));
    } catch (e) {
      //print(e); // better to remove print in release version
    }
  }

  int _selectedRadio = 0;
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 15.0),
                const Text('Age :',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                SizedBox(
                  width: 300,
                  //height: 100,
                  child: TextField(
                      controller: _controllerTarget,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'in Kg',
                          prefixIcon: Icon(Icons.track_changes))),
                ),
                const SizedBox(height: 15.0),
                const Text('Goal : ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10.0),
                MyDropdownMenuWidget(updatType: updateType),
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
                ElevatedButton(
                    onPressed: openResult,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors
                          .black, // Set your desired background color here
                    ),
                    child: const Icon(Icons.navigate_next, size: 40))
                /*const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.navigate_before, size: 50))*/
                ,
                const SizedBox(height: 50),
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
                          .black, // Set your desired background color here
                    ),
                    child: const Text('Update and SUM',
                        style: TextStyle(
                          fontSize: 18.0,
                        ))),
                Text(
                  'Values of X $_x and Y $_y SUM $_sum',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

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
  }
}
