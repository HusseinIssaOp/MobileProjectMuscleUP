import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<String> imageList = [
  'assets/6in1.jpg',
  'assets/1in2.jpg',
  'assets/3in2.jpg',
  'assets/4in2.jpg',
];

class Gym2 extends StatelessWidget {
  const Gym2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gold\'s Gym'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: ListView(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/white.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                CarouselSlider(
                  items: imageList.map((imagePath) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 10.0),
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                          ),
                          child: Image.asset(
                            imagePath,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    );
                  }).toList(),
                  // slideshow from internet
                  options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    onPageChanged: (index, reason) {},
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: Text(
                      'Embark on a transformative fitness journey at our cutting-edge gym, where state-of-the-art facilities converge with a motivating ambiance to redefine your well-being',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Location :',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    )),
                const SizedBox(height: 8),
                const Text('Tyre / Batoulay',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text('Subscription :',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    )),
                const SizedBox(height: 8),
                const Text('20\$ per month',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text('260\$ per year',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                const Text('Contact US:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(2, 2),
                        ),
                      ],
                    )),
                const SizedBox(height: 8),
                const Text('+961 35353535',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text('+961 03030303',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
