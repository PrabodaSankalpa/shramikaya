import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shramikaya/utils/colors.dart';
import 'package:shramikaya/widgets/google_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image.asset(
              'assets/logo.png',
              height: 180,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [primaryColor, accentColor],
                      ),
                      boxShadow: [BoxShadow(blurRadius: 15.0)],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      const Center(
                        child: Text(
                          "Shramikaya",
                          style: TextStyle(
                            fontFamily: "Baloo",
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                      Center(
                        child: SizedBox(
                          child: DefaultTextStyle(
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontFamily: 'Baloo',
                            ),
                            child: AnimatedTextKit(
                              animatedTexts: [
                                TypewriterAnimatedText(
                                  'Solutions Just Tap Away',
                                  speed: const Duration(milliseconds: 100),
                                ),
                              ],
                              repeatForever: true,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 70,
                      ),
                      ElevatedButton.icon(
                        style: googleButton,
                        onPressed: () {
                          signInWithGoogle();
                        },
                        icon: Image.asset(
                          "assets/google.png",
                          height: 25,
                        ),
                        label: const Text(
                          "Continue with Google",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  signInWithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    print(userCredential.user?.email);
  }
}
