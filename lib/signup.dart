// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import 'package:crypto/crypto.dart';
// import 'dart:math';

// final EncryptedSharedPreferences prefs = EncryptedSharedPreferences();

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key}) : super(key: key);

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _retypePasswordController =
//       TextEditingController();
//   final TextEditingController _cityController = TextEditingController();
//   final TextEditingController _streetController = TextEditingController();
//   final TextEditingController _buildingController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();

//   bool _isValidEmail(String? email) {
//     final emailRegex = RegExp(
//       '^[a-zA-Z0-9.!#\$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)+\$',
//     );
//     return email != null && emailRegex.hasMatch(email);
//   }

//   String generateSalt() {
//     // Generate a random salt using a secure random number generator
//     final secureRandom = Random.secure();
//     final List<int> saltBytes =
//         List<int>.generate(32, (index) => secureRandom.nextInt(256));
//     return base64.encode(saltBytes);
//   }

//   String hashPassword(String password, String salt) {
//     final bytes = utf8.encode(password + salt);
//     final hashedPassword = sha256.convert(bytes).toString();
//     return salt + hashedPassword;
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String labelText,
//     String hintText,
//     List<TextInputFormatter> inputFormatters,
//     bool obscureText,
//     BuildContext context,
//   ) {
//     return TextField(
//       controller: controller,
//       style: TextStyle(color: Colors.black87),
//       obscureText: obscureText,
//       decoration: InputDecoration(
//         labelText: labelText,
//         hintText: hintText,
//         labelStyle: TextStyle(color: Colors.black),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: Colors.black, width: 2.0),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//             color: Colors.black.withOpacity(0.5),
//             width: 1.0,
//           ),
//         ),
//       ),
//       inputFormatters: inputFormatters,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Sign Up'),
//         backgroundColor: Colors.black,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               SizedBox(height: 10.0),
//               Align(
//                 alignment: Alignment.topCenter,
//                 child: Text(
//                   'Sign up Form',
//                   style: TextStyle(
//                     fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               _buildTextField(
//                 _firstNameController,
//                 'First Name',
//                 'Enter your first name',
//                 [],
//                 false,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               _buildTextField(
//                 _lastNameController,
//                 'Last Name',
//                 'Enter your last name',
//                 [],
//                 false,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               _buildTextField(
//                 _emailController,
//                 'Email',
//                 'Enter your email',
//                 [],
//                 false,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               _buildTextField(
//                 _passwordController,
//                 'Password',
//                 'Enter your password',
//                 [],
//                 true,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               _buildTextField(
//                 _retypePasswordController,
//                 'Retype Password',
//                 'Retype your password',
//                 [],
//                 true,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               _buildTextField(
//                 _cityController,
//                 'City',
//                 'Enter your city',
//                 [],
//                 false,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               _buildTextField(
//                 _streetController,
//                 'Street',
//                 'Enter your street',
//                 [],
//                 false,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               _buildTextField(
//                 _buildingController,
//                 'Building',
//                 'Enter your building',
//                 [],
//                 false,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               _buildTextField(
//                 _phoneController,
//                 'Phone Number',
//                 'Enter your phone number',
//                 [FilteringTextInputFormatter.digitsOnly],
//                 false,
//                 context,
//               ),
//               SizedBox(height: 16.0),
//               ElevatedButton(
//                 onPressed: () async {
//                   if (_passwordController.text !=
//                       _retypePasswordController.text) {
//                     // Passwords do not match, show error message
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text('Error'),
//                           content:
//                               Text('Passwords do not match. Please re-enter.'),
//                           actions: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('OK',
//                                   style: TextStyle(color: Colors.black)),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   } else if (_anyFieldIsEmpty()) {
//                     // Display error message for empty fields
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text('Error'),
//                           content: Text('Please fill in all the fields.'),
//                           actions: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('OK',
//                                   style: TextStyle(color: Colors.black)),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   } else if (_phoneController.text.length != 8 ||
//                       !RegExp(r'^[0-9]+$').hasMatch(_phoneController.text)) {
//                     // Phone number must be 8 digits numbers only
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text('Error'),
//                           content: Text(
//                               'Phone number must be 8 digits numbers only.'),
//                           actions: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('OK',
//                                   style: TextStyle(color: Colors.black)),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                   } else if (!_isValidEmail(_emailController.text)) {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text('Error'),
//                           content: Text('Please enter a valid email address.'),
//                           actions: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('OK',
//                                   style: TextStyle(color: Colors.black)),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                     return; // Stop execution if email is invalid
//                   } else if (_passwordController.text.length < 8) {
//                     showDialog(
//                       context: context,
//                       builder: (context) {
//                         return AlertDialog(
//                           title: Text('Error'),
//                           content: Text(
//                               'Password must be at least 8 characters long.'),
//                           actions: [
//                             ElevatedButton(
//                               onPressed: () {
//                                 Navigator.of(context).pop();
//                               },
//                               child: Text('OK',
//                                   style: TextStyle(color: Colors.black)),
//                             ),
//                           ],
//                         );
//                       },
//                     );
//                     return; // Stop execution if password is too short
//                   } else {
//                     // Passwords match, no empty fields, and phone number is valid, proceed with sign-up logic
//                     final salt = generateSalt();
//                     // Hash the password
//                     final hashedPassword =
//                         hashPassword(_passwordController.text, salt);
//                     await prefs.setString('salt', salt);
//                     await prefs.setString('hashed_password', hashedPassword);
//                     _savesignup(
//                       _firstNameController.text,
//                       _lastNameController.text,
//                       _emailController.text,
//                       hashedPassword, // Use hashed password
//                       salt, // Store salt
//                       _cityController.text,
//                       _streetController.text,
//                       _buildingController.text,
//                       _phoneController.text,
//                       context,
//                     );
//                     // Continue with any other logic or navigation you need
//                   }
//                 },
//                 child: Text('Sign Up', style: TextStyle(color: Colors.black)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   void _savesignup(
//     String firstName,
//     String lastName,
//     String email,
//     String password,
//     String salt,
//     String city,
//     String street,
//     String building,
//     String phoneNumber,
//     BuildContext context,
//   ) async {
//     final data = {
//       'first_name': firstName,
//       'last_name': lastName,
//       'email': email,
//       'encrypted_password': password,
//       'salt': salt, // Include salt in the data
//       'city': city,
//       'street': street,
//       'building': building,
//       'phone_number': phoneNumber,
//     };

//     final response = await http.post(
//       Uri.https(
//         'unimobileapp.000webhostapp.com',
//         '/save_signup.php',
//       ),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(data), // Send data including salt
//     );

//     print('Response: ${response.body}');
//     if (response.statusCode == 200) {
//       print('Signed up successfully');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Signed up successfully'),
//           duration: Duration(seconds: 5),
//         ),
//       );
//       Navigator.popUntil(context, (route) => route.isFirst);
//     } else {
//       print('Error: ${response.body}');
//     }
//   }

//   bool _anyFieldIsEmpty() {
//     return _firstNameController.text.isEmpty ||
//         _lastNameController.text.isEmpty ||
//         _emailController.text.isEmpty ||
//         _passwordController.text.isEmpty ||
//         _retypePasswordController.text.isEmpty ||
//         _cityController.text.isEmpty ||
//         _streetController.text.isEmpty ||
//         _buildingController.text.isEmpty ||
//         _phoneController.text.isEmpty;
//   }

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     _retypePasswordController.dispose();
//     _cityController.dispose();
//     _streetController.dispose();
//     _buildingController.dispose();
//     _phoneController.dispose();
//     super.dispose();
//   }
// }
