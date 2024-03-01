import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              // margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.all(20),
              // height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(5, 1))
                ],
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                // shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'Hello Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Row(
              children: [
                Text('data'),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(20),
              // height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                // shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'Hello Flutter',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
