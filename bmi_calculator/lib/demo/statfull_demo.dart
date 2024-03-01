import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   print('object');
  // }

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Container Demo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$counter',
                style: const TextStyle(fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          setState(() {
                            counter--;
                          });
                        },
                        icon: const Icon(Icons.remove)),
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: Colors.grey,
                            foregroundColor: Colors.white),
                        onPressed: () {
                          setState(() {
                            counter++;
                          });
                        },
                        icon: const Icon(Icons.add)),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
