import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
            size: 25,
          ),
          centerTitle: true,
          title: const Text(
            'My First App',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.settings)),
            IconButton(
                color: Colors.white,
                onPressed: () {},
                icon: const Icon(Icons.search)),
          ],
        ),
        body: Center(
          child: Column(
            // الطول
            mainAxisAlignment: MainAxisAlignment.center,
            // العرض
            children: [
              // image rounded by radius // as a circle

              const CircleAvatar(
                radius: 100,
                backgroundColor: Colors.grey,
                // backgroundImage: AssetImage('assets/112.jpg'),
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS0bWuKCz4gtbALIq4CBCVK47PHCGoSFg1Fzg&s'),
              ),
              // ClipRRect(
              //   borderRadius: const BorderRadius.only(
              //       topLeft: Radius.circular(20),
              //       bottomRight: Radius.circular(20)),
              //   child: Image.asset(
              //     'assets/112.jpg',
              //     width: 300,
              //     fit: BoxFit.cover,
              //   ),
              // ),
              const SizedBox(height: 20),
              const Text(
                'Sayed Abdul-Aziz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Flutter Developer',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook_rounded,
                        color: Colors.blue,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.camera_alt_rounded,
                        color: Colors.redAccent,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.snapchat_rounded,
                        color: Colors.amber,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.telegram_rounded,
                        color: Colors.lightBlue,
                      )),
                ],
              ),
              
            ],
          ),
        ));
  }
}
