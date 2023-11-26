import 'package:flutter/material.dart';
import 'package:test/allgym.dart';
import 'package:test/calc.dart';
//import 'package:test/gym2.dart';
//import 'package:test/gym3.dart';
//import 'allgym.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // double screenHeight = MediaQuery.of(context).size.height;
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
        body: ListView(children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/try3.webp'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(children: [
                const SizedBox(height: 20),
                const Text('Welcome To MuscleUP',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold)),
                const Text('Scroll down',
                    style: TextStyle(color: Colors.deepOrange, fontSize: 18)),
                const SizedBox(height: 457),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Calc()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    alignment: Alignment.bottomRight, // Set text color
                    padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal:
                            20), // Set padding to make the button smaller
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Set border radius
                    ),
                    elevation: 8, // Set elevation for a shadow effect
                    shadowColor: Colors.black, // Set shadow color
                    visualDensity:
                        VisualDensity.standard, // Standard visual density
                    tapTargetSize:
                        MaterialTapTargetSize.padded, // Set tap target size
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20), // Set border radius for the container
                      gradient: const LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.deepOrange
                        ], // Gradient background
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Shadow color
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4), // Offset of the shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.calculate, size: 30), // Adjust icon size
                        SizedBox(
                            width:
                                5), // Add some spacing between the icon and text
                        Text(
                          'Start your fitness Journey',
                          style: TextStyle(fontSize: 16), // Adjust text size
                        ),
                      ],
                    ),
                  ),
                ),
                //const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Allgym()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.black,
                    alignment: Alignment.bottomRight, // Set text color
                    padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal:
                            20), // Set padding to make the button smaller
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20), // Set border radius
                    ),
                    elevation: 8, // Set elevation for a shadow effect
                    shadowColor: Colors.black, // Set shadow color
                    visualDensity:
                        VisualDensity.standard, // Standard visual density
                    tapTargetSize:
                        MaterialTapTargetSize.padded, // Set tap target size
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          20), // Set border radius for the container
                      gradient: const LinearGradient(
                        colors: [
                          Colors.orange,
                          Colors.deepOrange
                        ], // Gradient background
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Shadow color
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: const Offset(0, 4), // Offset of the shadow
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fitness_center,
                            size: 30), // Adjust icon size
                        SizedBox(
                            width:
                                5), // Add some spacing between the icon and text
                        Text(
                          'Available Gyms',
                          style: TextStyle(fontSize: 16), // Adjust text size
                        ),
                      ],
                    ),
                  ),
                ),
                /*const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Gym2()));
                  },
                  child: const Icon(Icons.navigate_next, size: 50)),
              const SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Gym3()));
                  },
                  child: const Icon(Icons.navigate_next, size: 50))*/
              ]),
            ),
          )
        ]));
  }
}
