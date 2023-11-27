import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

List<String> imageList = [
  'assets/3.jpg',
  'assets/1in3.jpeg',
  'assets/2in3.jpeg',
  'assets/3in3.jpg',
];

class Gym3 extends StatelessWidget {
  const Gym3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dream Gym'),
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
                      'Discover the pinnacle of fitness excellence in our new gym, where innovation, inspiration, and empowerment converge to sculpt a healthier, stronger you.',
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
                const Text('Byblos / byblos city',
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
                const Text('25\$ per month',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text('220\$ per year',
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
                const Text('+961 43434343',
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                const Text('+961 23232323',
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
