import 'package:flutter/material.dart';

class Firstpage extends StatefulWidget {
  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(), label: Text("email")),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
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
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 238, 130, 166),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Text(
                    "Sign in",
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
              Text(
                "Login",
                style:
                    TextStyle(color: const Color.fromARGB(255, 236, 123, 161)),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Forgot password ?",
            style: TextStyle(color: Colors.blue, fontSize: 16),
          )
        ],
      ),
    );
  }
}
