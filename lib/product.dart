// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'cart.dart';

const String _baseURL = 'unimobileapp.000webhostapp.com';

class Supplies {
  int _id;
  String _name;
  int _price;
  String _img;

  Supplies(this._id, this._name, this._price, this._img);
  int get id => _id;
  @override
  String toString() {
    return 'Name: $_name    Price: \$_price';
  }

  String get name => _name;
  int get price => _price;
}

List<Supplies> _supplies = [];

Future<void> updateSupplies(Function(bool success) update) async {
  try {
    final url = Uri.https(_baseURL, 'getSupplies.php');
    final response = await http.get(url).timeout(const Duration(seconds: 5));

    if (response.statusCode == 200) {
      final jsonResponse = convert.jsonDecode(response.body);

      _supplies.clear();

      for (var row in jsonResponse) {
        try {
          Supplies p = Supplies(
            int.parse(row['id'].toString()),
            row['name'].toString(),
            int.parse(row['price'].toString()),
            row['img'].toString(),
          );
          _supplies.add(p);
        } catch (e) {
          print('Error creating Supplies object: $e');
        }
      }
      update(true);
    } else {
      print('HTTP Request failed with status: ${response.statusCode}');
      update(false);
    }
  } catch (e) {
    print('Error during HTTP Request: $e');
    update(false);
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('Available Supplements'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: const ShowSupplies(),
    ),
  ));
}

class ShowSupplies extends StatefulWidget {
  const ShowSupplies({Key? key}) : super(key: key);

  @override
  _ShowSuppliesState createState() => _ShowSuppliesState();
}

class _ShowSuppliesState extends State<ShowSupplies> {
  bool _isLoading = true;
  List<int> _selectedQuantities = [];
  List<CartItem> _cartItems = [];
  List<Supplies> _filteredSupplies = [];

  @override
  void initState() {
    super.initState();
    updateSupplies((success) {
      setState(() {
        _isLoading = false;
        _supplies.length = _supplies.length < 5 ? 5 : _supplies.length;
        _selectedQuantities = List<int>.filled(_supplies.length, 1);
        _filteredSupplies = List.from(_supplies);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Available Supplements'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: _SuppliesSearchDelegate(
                  _supplies,
                  _filteredSupplies,
                  (filteredSupplies) {
                    setState(() {
                      _filteredSupplies = filteredSupplies;
                    });
                  },
                ),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                // Reset all quantities to 1
                _selectedQuantities = List<int>.filled(_supplies.length, 1);
              });
            },
          ),
        ],
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      if (index < _filteredSupplies.length) {
                        return Card(
                          margin: const EdgeInsets.all(8.0),
                          elevation: 4.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/${_filteredSupplies[index]._img}',
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 16.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _filteredSupplies[index]._name,
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        'Price: \$${_filteredSupplies[index]._price}',
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        children: [
                                          const Text('Quantity:'),
                                          const SizedBox(width: 8.0),
                                          DropdownButton<int>(
                                            value: _selectedQuantities[index],
                                            onChanged: (value) {
                                              setState(() {
                                                _selectedQuantities[index] =
                                                    value!;
                                              });
                                            },
                                            items: List.generate(
                                              10,
                                              (i) => DropdownMenuItem<int>(
                                                value: i + 1,
                                                child: Text('$i'),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                    childCount: _filteredSupplies.length,
                  ),
                ),
              ],
            ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: _viewAllProducts,
              child: Icon(Icons.view_list),
              backgroundColor: Colors.black,
            ),
          ),
        ],
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          _cartItems.clear();

          if (_selectedQuantities.every((quantity) => quantity == 1)) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Error'),
                  content: Text('Please select at least one product.'),
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

          for (int i = 0; i < _filteredSupplies.length; i++) {
            final selectedSupply = _filteredSupplies[i];
            final selectedQuantity = _selectedQuantities[i];
            if (selectedSupply != null && selectedQuantity > 0) {
              final cartItem = CartItem(selectedSupply, selectedQuantity);
              _cartItems.add(cartItem);
            }
          }

          if (_cartItems.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(cartItems: _cartItems),
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          onPrimary: const Color.fromRGBO(255, 255, 255, 1), // Text color
          padding: const EdgeInsets.symmetric(
              horizontal: 24, vertical: 24), // Adjust the padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: const Text(
          'Proceed',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _viewAllProducts() {
    setState(() {
      // Create a map to store the selected quantities based on product ID
      final Map<int, int> selectedQuantitiesMap = {};

      // Set the selected quantities based on the search list
      for (int i = 0; i < _filteredSupplies.length; i++) {
        final selectedSupply = _filteredSupplies[i];
        final selectedQuantity = _selectedQuantities[i];

        // Store the selected quantity in the map with the product ID
        selectedQuantitiesMap[selectedSupply.id] = selectedQuantity;
      }

      // Set the selected quantities for all available supplies
      for (int i = 0; i < _supplies.length; i++) {
        final supply = _supplies[i];

        // Check if the product ID exists in the map
        if (selectedQuantitiesMap.containsKey(supply.id)) {
          // If the product is in the search list, update its quantity
          _selectedQuantities[i] = selectedQuantitiesMap[supply.id]!;
        } else {
          // If not found, set the quantity to the existing value or 1
          _selectedQuantities[i] =
              _selectedQuantities.length > i ? _selectedQuantities[i] : 1;
        }
      }
      _selectedQuantities[0] = 1;
      // Set _filteredSupplies to be a copy of _supplies
      _filteredSupplies = List.from(_supplies);
    });
  }

  void _filterSupplies(String itemName) {
    setState(() {
      if (itemName.isNotEmpty) {
        _filteredSupplies = _supplies
            .where((supply) =>
                supply.name.toLowerCase().contains(itemName.toLowerCase()))
            .toList();
      } else {
        _filteredSupplies = List.from(_supplies);
      }
    });
  }
}

class _SuppliesSearchDelegate extends SearchDelegate<Supplies> {
  final List<Supplies> supplies;
  List<Supplies> filteredSupplies;
  final Function(List<Supplies>) onProductsSelected;

  _SuppliesSearchDelegate(
      this.supplies, this.filteredSupplies, this.onProductsSelected);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        onProductsSelected([]);
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSearchResults(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSearchResults(query);
  }

  Widget _buildSearchResults(String query) {
    final results = _filterSupplies(query);

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final supply = results[index];
        return ListTile(
          title: Text(supply.name),
          onTap: () {
            onProductsSelected([supply]);
            close(context, supply);
          },
        );
      },
    );
  }

  List<Supplies> _filterSupplies(String query) {
    return supplies
        .where(
          (supply) => supply.name.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();
  }
}
