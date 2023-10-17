import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shramikaya/screens/work_profile_form.dart';
import 'package:shramikaya/utils/colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final displayName = FirebaseAuth.instance.currentUser!.displayName!;
    final photoUrl = FirebaseAuth.instance.currentUser!.photoURL!;
    final userEmail = FirebaseAuth.instance.currentUser!.email!;

    // final isLongName;
    // if (displayName.length < 10) {
    //   isLongName = false;
    // } else {
    //   isLongName = true;
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: silverColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Card(
                  elevation: 5,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    height: (MediaQuery.of(context).size.height / 100) * 20,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(photoUrl),
                          radius: 40,
                          backgroundColor: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              displayName,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              userEmail,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                            ),
                            ElevatedButton.icon(
                              onPressed: () async {
                                await GoogleSignIn().signOut();
                                FirebaseAuth.instance.signOut();
                              },
                              icon: const Icon(
                                Icons.logout_rounded,
                                color: primaryColor,
                              ),
                              label: const Text(
                                "Sign Out",
                                style: TextStyle(color: primaryColor),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.1),
                child: Card(
                  elevation: 5,
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(
                      left: 0,
                      top: 5,
                      right: 0,
                      bottom: 5,
                    ),
                    width: 650,
                    height: 350,
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      //borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color.fromARGB(255, 249, 250, 250),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.control_point_rounded,
                              size: 100,
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WorkProfileForm()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(295, 60),
                              padding: const EdgeInsets.all(16.0),
                              foregroundColor: Colors.white,
                              backgroundColor: secondaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                            ),
                            child: const Text(
                              'Create your work profile',
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
              ),
              // Add the rest of your content here
            ],
          ),
        ),
      ),
    );
  }
}
