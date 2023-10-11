import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fishsnap/constants.dart';
import 'package:fishsnap/root.dart';
import 'package:fishsnap/signup.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController.text,
        password: _passwordTextController.text,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) => const RootPage()));
    } on FirebaseAuthException catch (e) {
      print("Sign in error: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   backgroundColor: Colors.blue
      // ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    const Text(
                      "Welcome!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 38,
                        fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Please login to continue",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                        ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  Container(
                      margin: const EdgeInsets.only(left: 40,right: 40),
                      child: reusableTextField(
                          "Enter User Name",Icons.person_2_outlined,false,
                        _emailTextController
                        ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40,right: 40),
                      child: reusableTextField(
                        "Enter Password",Icons.lock_outline,true,
                        _passwordTextController
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 40,right: 40),
                      child: signInSignUpButton(context,true, (){
                        _signInWithEmailAndPassword();
                      }),
                    ),
                    signUpOption()
                ],
              ),
        ),
      ),
      );
  }

  Row signUpOption() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text(
        "Don't you have an account?",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      GestureDetector(
        onTap: () {
          // You can uncomment the following lines to navigate to the sign-up page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>SignUpPage()),
          );
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}
}