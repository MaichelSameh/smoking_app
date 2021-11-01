import 'package:flutter/material.dart';

import 'size.dart';

class ResultScreen extends StatelessWidget {
  final double quantity;
  final double price;
  const ResultScreen({
    Key? key,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = Size(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smoking app"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You spend",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: _size.height(50)),
            Text(
              (price * quantity).toString() + " \$ dollar per day",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: _size.height(50)),
            Text(
              (price * quantity * 30).toString() + " \$ dollar per month",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(height: _size.height(50)),
            Text(
              (price * quantity * 365).toString() + " \$ dollar per year",
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }
}
