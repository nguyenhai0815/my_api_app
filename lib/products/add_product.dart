import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'api_service.dart';
import 'product.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key? key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final TextEditingController _titleController = TextEditingController();
  final ApiService _productService = ApiService();

  List<Product> _products = [];

  bool _isProductAdded = false;

  void _addProduct(String name) {
    final newProduct = NewProduct(
      name: name,
      price: 0.0,
    );

    _productService.addProduct(newProduct).then((newProduct) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Product added successfully!'),
        ),
      );
      setState(() {
        _isProductAdded = true;
        _products.add(newProduct);
      });
      Navigator.pop(context, true);
    }).catchError((error) {
      if (kDebugMode) {
        print('Error adding product: $error');
      }
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to add product. Please try again.'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Product name'),
            ),
            ElevatedButton(
              onPressed: () {
                final name = _titleController.text;
                _addProduct(name);
              },
              child: const Text('Add Product'),
            ),
          ],
        ),
      ),
    );
  }
}
