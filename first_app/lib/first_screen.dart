import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: const Icon(
            Icons.menu,
            color: Colors.deepOrange,
            size: 25,
          ),
          centerTitle: true,
          title: const Text(
            'My First App',
            style: TextStyle(color: Colors.deepOrange),
          ),
          actions: [
            IconButton(
                color: Colors.deepOrange,
                onPressed: () {},
                icon: const Icon(Icons.settings)),
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
                  color: Colors.deepOrange,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Flutter Developer',
                style: TextStyle(
                  color: Colors.white60,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook_rounded,
                            color: Colors.blue,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt_rounded,
                            color: Colors.redAccent,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.snapchat_rounded,
                            color: Colors.amber,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.telegram_rounded,
                            color: Colors.lightBlue,
                          )),
                    ],
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '@sayedabdulaziz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '@sayedabdulaziz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '@sayedabdulaziz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '@sayedabdulaziz',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Colors.white,
                          )),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
