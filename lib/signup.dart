import 'package:fishsnap/constants.dart';
import 'package:fishsnap/root.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  void _signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RootPage()));
      // You can handle the newly created user here, such as storing user data in Firebase Firestore.
      print('User signed up: ${userCredential.user?.email}');
    } catch (e) {
      print('Error during signup: $e');
      // Handle signup errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: const Text(
                          "Dive into the world of fish",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.normal),
                        ),
                      ),
                      const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const Text(
                        "Enter your details to continue",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                          ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      child: reusableTextField(
                        "User name",
                        Icons.person,
                        false,
                        _usernameController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      child: reusableTextField(
                        "Email",
                        Icons.email,
                        false,
                        _emailController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      child: reusableTextField(
                        "Password",
                        Icons.lock_outline,
                        true,
                        _passwordController,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      margin: const EdgeInsets.only(left: 25, right: 25),
                      child: Center(
                        child: signInSignUpButton(context, true, _signUp),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}