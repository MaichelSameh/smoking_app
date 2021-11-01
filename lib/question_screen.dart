import 'package:flutter/material.dart';

import 'custom_text_field.dart';
import 'size.dart';
import 'result_screen.dart';

class QuestionScreen extends StatelessWidget {
  QuestionScreen({Key? key}) : super(key: key);

  final TextEditingController quantityController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smoking app"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _size.width(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              headerKey: "How many pack of cigarettes you need per day?",
              hintKey: "How many",
              controller: quantityController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: _size.height(50)),
            CustomTextField(
              headerKey: "How much a pack of cigarettes coast?",
              hintKey: "price",
              controller: priceController,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: _size.height(50)),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => ResultScreen(
                      price: double.parse(priceController.text),
                      quantity: double.parse(quantityController.text),
                    ),
                  ),
                );
              },
              child: SizedBox(
                child: const Center(child: Text("Submit")),
                width: double.infinity,
                height: _size.height(50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
