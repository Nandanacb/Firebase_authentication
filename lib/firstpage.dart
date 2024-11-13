import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication/forgotpasswordscreen.dart';
import 'package:firebase_authentication/secondpage.dart';
import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
      print('User signed up');
    } catch (e) {
      print('sign-up error:$e');
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
          SizedBox(height: 35),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("email")),
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
                  border: OutlineInputBorder(), label: Text("password")),
            ),
          ),
          SizedBox(height: 45),
          SizedBox(
            height: 60,
            width: 350,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    signUp();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Secondpage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 238, 130, 166),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    "Sign up",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  )),
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Already you have an account ? ",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Secondpage()));
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 236, 123, 161)),
                ),
              ),
            ],
          ),
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
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
