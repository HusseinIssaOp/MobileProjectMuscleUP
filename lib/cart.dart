import 'package:flutter/material.dart';
import 'product.dart';

class CartItem {
  final Supplies? supply;
  final int quantity;

  CartItem(this.supply, this.quantity);
}

class CartPage extends StatelessWidget {
  final List<CartItem> cartItems;

  const CartPage({Key? key, required this.cartItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];

          if (cartItem.quantity == 1) {
            return SizedBox.shrink();
          }

          return ListTile(
            title: Text(
              '${cartItem.supply?.name ?? 'Unknown Product'}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Quantity: ${cartItem.quantity - 1}'),
          );
        },
      ),
    );
  }
}
