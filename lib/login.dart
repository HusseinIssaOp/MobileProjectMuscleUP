// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert' as convert;

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   static const String _baseURL = 'unimobileapp.000webhostapp.com';

//   String _errorMessage = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 labelText: 'Email',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 labelText: 'Password',
//               ),
//             ),
//             SizedBox(height: 16.0),
//             ElevatedButton(
//               onPressed: _login,
//               child: Text('Login', style: TextStyle(color: Colors.black)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<bool> checkCredentials(String email, String password) async {
//     try {
//       final response = await http.post(Uri.https(_baseURL, '/getUser.php'),
//           body: {
//             'email': email,
//             'password': password
//           }).timeout(Duration(seconds: 30));

//       // Print the response body for debugging
//       print('Response Body: ${response.body}');

//       // Check if the response status code indicates success
//       if (response.statusCode == 200) {
//         final dynamic data = convert.jsonDecode(response.body);

//         // Check if the response body is a Map
//         if (data is Map<String, dynamic> && data.containsKey('isValidUser')) {
//           return data['isValidUser'];
//         } else {
//           // If the response body is not a Map or does not contain 'isValidUser'
//           throw FormatException('Invalid response format');
//         }
//       } else {
//         // If the response status code indicates an error
//         throw Exception(
//             'Failed to check credentials. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       // Handle exceptions and print the error for debugging
//       print('Error: $e');
//       throw Exception('Failed to check credentials');
//     }
//   }

//   Future<void> _login() async {
//     try {
//       final bool isValidUser = await checkCredentials(
//         _emailController.text,
//         _passwordController.text, // Send plain text password
//       );

//       if (isValidUser) {
//         // Successful login
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Logged in successfully'),
//             duration: Duration(seconds: 3),
//           ),
//         );

//         // Navigate to the home page or any other destination after successful login
//         Navigator.pushReplacementNamed(context, '/home');
//       } else {
//         // Show an error message for invalid credentials
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               title: Text('Error'),
//               content: Text('Invalid email or password'),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text(
//                     'OK',
//                     style: TextStyle(color: Colors.black),
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       }
//     } catch (e) {
//       // Handle exceptions
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to check credentials'),
//             actions: [
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: Text(
//                   'OK',
//                   style: TextStyle(color: Colors.black),
//                 ),
//               ),
//             ],
//           );
//         },
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }
// }
