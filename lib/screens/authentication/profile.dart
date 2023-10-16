import 'package:flutter/material.dart';

void main() {
  runApp(const ProfileApp());
}

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(204, 204, 204, 1),
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  height: (MediaQuery.of(context).size.height / 100) * 15,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('URL_TO_PROFILE_IMAGE'),
                        radius: 40,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            'Name',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'example@gmail.com',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.1),
                child: Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(
                    left: 0,
                    top: 40,
                    right: 0,
                    bottom: 5,
                  ),
                  width: 650,
                  height: 350,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Color.fromARGB(255, 249, 250, 250),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/upload.png', // Replace with your image path
                            width: 90, // Adjust image size
                            height: 90, // Adjust image size
                          ),
                        ],
                      ),
                      const Text(
                        'Publish Your First Gig',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 33, 16, 16),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Column(
                        children: [
                          Text(
                            'You can register as a seller',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'and upgrade your job to the next level.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Align(
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () {
                            // Implement the image upload functionality here
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(295, 60),
                            padding: const EdgeInsets.all(16.0),
                            foregroundColor: Colors.white,
                            backgroundColor:
                                const Color.fromARGB(255, 204, 153, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(150.0),
                            ),
                          ),
                          child: const Text(
                            'Create your own profile',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Add the rest of your content here
            ],
          ),
        ),
      ),
    );
  }
}
