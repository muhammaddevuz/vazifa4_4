import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String title = '';
  String price = '';

  final _formKey = GlobalKey<FormState>();

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Add Product"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos title kiriting";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  title = newValue;
                }
              },
            ),
            TextFormField(
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Price',
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos narx kiriting";
                }
                try {
                  double.parse(value);
                } catch (e) {
                  return "Iltimos raqam kiriting";
                }
                return null;
              },
              onSaved: (newValue) {
                if (newValue != null) {
                  price = newValue;
                }
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text("Cancel")),
        ElevatedButton(
            onPressed: () {
              _add();
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                Navigator.pop(context, {
                  "title": title,
                  "price": price,
                });
              }
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, foregroundColor: Colors.white),
            child: const Text("Qo'shish"))
      ],
    );
  }
}
