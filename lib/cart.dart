// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'product.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
// import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

const String _baseURL = 'https://unimobileapp.000webhostapp.com';
// used to retrieve the key later
// EncryptedSharedPreferences _encryptedData = EncryptedSharedPreferences();

class CartItem {
  final Supplies? supply;
  final int quantity;

  CartItem(this.supply, this.quantity);
}

class CartPage extends StatefulWidget {
  final List<CartItem> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _streetController = TextEditingController();
  final TextEditingController _buildingController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  double calculateTotalPrice() {
    double totalPrice = 0.0;

    for (var cartItem in widget.cartItems) {
      if (cartItem.quantity > 1 && cartItem.supply != null) {
        totalPrice += cartItem.supply!.price * (cartItem.quantity - 1);
      }
    }

    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.0),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Delivery Address',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildTextField(
                  _firstNameController,
                  'First Name',
                  'Enter your first name',
                  [],
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  _lastNameController,
                  'Last Name',
                  'Enter your last name',
                  [],
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  _cityController,
                  'City',
                  'Enter your city',
                  [],
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  _streetController,
                  'Street',
                  'Enter your street',
                  [],
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  _buildingController,
                  'Building',
                  'Enter your building',
                  [],
                ),
                SizedBox(height: 16.0),
                _buildTextField(
                  _phoneController,
                  'Phone Number',
                  'Enter your phone number',
                  [FilteringTextInputFormatter.digitsOnly],
                  // Allow only digits
                ),
              ],
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Selected Products',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.grey[200],
                      ),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.cartItems.length,
                        itemBuilder: (context, index) {
                          final cartItem = widget.cartItems[index];

                          if (cartItem.quantity == 1) {
                            return SizedBox.shrink();
                          }

                          return Container(
                            width: 150.0,
                            margin: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Card(
                              child: ListTile(
                                title: Text(
                                  '${cartItem.supply?.name ?? 'Unknown Product'}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle:
                                    Text('Quantity: ${cartItem.quantity - 1}'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _showConfirmationDialog();
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), // Rounded corners
              ),
              elevation: 4.0,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.shopping_cart),
                  SizedBox(width: 8.0),
                  Text('Buy'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String labelText,
    String hintText,
    List<TextInputFormatter>
        inputFormatters, // thhe input format for the fields
  ) {
    return TextField(
      controller: controller,
      style: TextStyle(color: Colors.black87),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        labelStyle: TextStyle(color: Colors.black),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black.withOpacity(0.5), width: 1.0),
        ),
      ),
      inputFormatters: inputFormatters, //call
    );
  }

  void _showConfirmationDialog() {
    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final city = _cityController.text.trim();
    final street = _streetController.text.trim();
    final building = _buildingController.text.trim();
    final phone = _phoneController.text.trim();
    final selectedProducts = widget.cartItems
        .where((cartItem) => cartItem.quantity > 1)
        .map((cartItem) =>
            '${cartItem.supply?.name ?? 'Unknown Product'} - Quantity: ${cartItem.quantity - 1}')
        .toList();

    if (firstName.isEmpty ||
        lastName.isEmpty ||
        city.isEmpty ||
        street.isEmpty ||
        building.isEmpty ||
        phone.isEmpty ||
        phone.length != 8 ||
        !RegExp(r'^[0-9]+$').hasMatch(phone)) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text(
                'Please fill in all the required fields and provide a valid 8-digit phone number.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                ),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
      return;
    }

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: $firstName $lastName'),
              Text('Address: $city, $street, $building'),
              Text('Phone Number: $phone'),
              SizedBox(height: 16.0),
              Text('Selected Products:'),
              ...selectedProducts.map((product) => Text(product)),
              SizedBox(height: 16.0),
              Text(
                  'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _saveCheckoutToDatabase(firstName, lastName, city, street,
                    building, phone, selectedProducts);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
                onPrimary: Colors.white,
              ),
              child: Text('Confirm'),
            ),
          ],
        );
      },
    );
  }

  void _saveCheckoutToDatabase(
      String firstName,
      String lastName,
      String city,
      String street,
      String building,
      String phone,
      List<String> selectedProducts) async {
    double totalPrice = calculateTotalPrice();
    final data = {
      'checkout_id': 'generate_unique_id',
      'fname': firstName,
      'lname': lastName,
      'city': city,
      'street': street,
      'building': building,
      'phonenumber': phone,
      'selected_products': selectedProducts.join('\n'),
      'totalprice': totalPrice.toString(),
    };

    // Send HTTP
    final response = await http.post(
      Uri.parse('$_baseURL/save_checkout.php'),
      headers: {'Content-Type': 'application/json'},
      body: convert.jsonEncode(data),
    );
    print('Response: ${response.body}');
    if (response.statusCode == 200) {
      print('Checkout saved successfully');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Thanks for ordering! We will contact you soon.'),
          duration: Duration(seconds: 5),
        ),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
    } else {
      print('Error saving checkout: ${response.body}');
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _cityController.dispose();
    _streetController.dispose();
    _buildingController.dispose();
    _phoneController.dispose();
    super.dispose();
  }
}
