import 'package:flutter/material.dart';

class ReBatikPage extends StatelessWidget {
  const ReBatikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ReBatik'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.palette, size: 80, color: Colors.brown),
            SizedBox(height: 20),
            Text(
              'Welcome to ReBatik!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Halaman ReBatik sedang dikembangkan.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
