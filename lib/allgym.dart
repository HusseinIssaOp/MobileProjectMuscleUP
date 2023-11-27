import 'package:flutter/material.dart';
import 'gym2.dart';
import 'gym1.dart';
import 'gym3.dart';
import 'gym4.dart';

class Allgym extends StatefulWidget {
  const Allgym({super.key});

  @override
  State<Allgym> createState() => _Allgym();
}

class _Allgym extends State<Allgym> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      screenWidth = screenWidth * 0.8;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Availabe Gyms'),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  Column(children: [
                    Image.asset(
                      'assets/1in1.jpg',
                      width: screenWidth * 0.75,
                      height: screenHeight * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ]),
                  // const SizedBox(width: 10),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Gym1()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.35,
                        50,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Gym1',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  // const SizedBox(width: 30),
                  const SizedBox(height: 50),
                  Column(children: [
                    Image.asset(
                      'assets/2title.jpg',
                      width: screenWidth * 0.75,
                      height: screenHeight * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ]),
                  // const SizedBox(width: 30),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Gym2()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.35,
                        50,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Gym2',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  //const SizedBox(width: 30),
                  const SizedBox(height: 50),
                  Column(children: [
                    Image.asset(
                      'assets/3title.jpg',
                      width: screenWidth * 0.75,
                      height: screenHeight * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ]),
                  // const SizedBox(width: 30),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Gym3()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.35,
                        50,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Gym3',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  //  const SizedBox(width: 30),
                  const SizedBox(height: 50),
                  Column(children: [
                    Image.asset(
                      'assets/4title.jpg',
                      width: screenWidth * 0.75,
                      height: screenHeight * 0.5,
                      fit: BoxFit.cover,
                    ),
                  ]),
                  // const SizedBox(width: 30),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Gym4()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5.0,
                      fixedSize: Size(
                        MediaQuery.of(context).size.width * 0.35,
                        50,
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: 10),
                        Text(
                          'Gym4',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const SizedBox(height: 30),
                  // b3mal mse7a t7t
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
