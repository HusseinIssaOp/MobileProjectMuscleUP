import 'package:flutter/material.dart';
import 'user.dart';

class Result extends StatelessWidget {
  const Result({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    // final type = ModalRoute.of(context)!.settings.arguments as Type;

    return Scaffold(
        appBar: AppBar(
          title: const Text('MuscleUP'),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/white.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(children: [
                const SizedBox(height: 10),
                Text(user.toString(),
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 54, 248),
                        fontSize: 24,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),

                /*const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.navigate_before, size: 50))*/
              ]),
            )));
  }
}
