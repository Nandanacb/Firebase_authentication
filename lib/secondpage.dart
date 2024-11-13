import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget {
  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {
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
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "email"),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 50,
            width: 300,
            child: TextField(
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
                  onPressed: () {},
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
          Text(
            "Forgot password ?",
            style: TextStyle(color: Colors.blue),
          )
        ],
      ),
    );
  }
}
