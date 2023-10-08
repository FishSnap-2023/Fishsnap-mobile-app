import 'package:flutter/material.dart';

class Constants {
  // Primary color for a fish identification app
  static var primaryColor = const Color.fromARGB(255, 0, 102, 204);
  static var backgroundColor = const Color.fromARGB(255, 2, 1, 49);
  static var titleOne = "Discover Fish Species";
  static var descriptionOne = "Explore a vast collection of fish species and their characteristics.";
  static var titleTwo = "Identify Fishes";
  static var descriptionTwo = "Use our AI-powered tool to identify unknown fish species from photos.";
  static var titleThree = "Be Kind";
  static var descriptionThree = "Dive into the world of fish";
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
            TextEditingController controller){
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: isPasswordType,
    cursorColor: Colors.white,
    style: const TextStyle(
      fontSize: 16,
      color: Colors.white
    ),
    decoration: InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white.withOpacity(0.9),
      ),
      labelText: text,
      labelStyle: TextStyle(
        color: Colors.white.withOpacity(0.9),
        fontSize: 16,
      ),
      filled: true,
      fillColor: const Color.fromARGB(255, 167, 217, 230).withOpacity(0.3),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.transparent
        )
      ),
    ),
    keyboardType: isPasswordType
    ? TextInputType.visiblePassword
    : TextInputType.emailAddress,
  );
}

Container signInSignUpButton(BuildContext context, bool isLogin, Function onTap) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 50,
    margin: const EdgeInsets.fromLTRB(0, 10, 0, 20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
    ),
    child: ElevatedButton(
      onPressed: () {
        onTap();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.pressed)) {
            return Colors.white.withOpacity(0.5);
          }
          return Colors.white.withOpacity(0.2);
        }),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text(
        isLogin ? "Sign In" : "Sign Up",
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
