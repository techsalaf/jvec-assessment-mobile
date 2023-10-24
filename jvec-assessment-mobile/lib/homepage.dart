import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
              child: Center(
                child: Text('Responsive Design Example'),
              ),
            ),
          ),
          Flexible(
            child: Container(
              color: Colors.green,
              child: Center(
                child: Text('Another Section'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
