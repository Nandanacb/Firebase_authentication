import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/forgotpasswordscreen.dart';
import 'package:firebase_authentication/thirdpage.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget {
  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> signIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      print('User signed in');
    } catch (e) {
      print('sign-in error:$e');
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text(message),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/sign.jpg"),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 25),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "email"),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "password"),
            ),
          ),
          SizedBox(height: 80),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () {
                    signIn();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Thirdpage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 223, 119, 153),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    "Log in",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen()));
                },
                child: Text(
                  "Forgot password ?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
