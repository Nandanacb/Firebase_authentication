import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isloading = false;
  String? _errorMessage = null;

  Future<void> _sendPasswordResetEmail() async {
    setState(() {
      _isloading = true;
      _errorMessage = null;
    });
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      setState(() {
        _isloading = false;
      });

      _showDialog('Password reset email send! Please check your inbox.');
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isloading = false;
      });
      _showDialog(e.message ?? 'An error occurred');
    }
  }

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Notification'),
              content: Text(message),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("OK")),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Forgot password"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  hintText: 'example@example.com',
                  errorText: _errorMessage,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              _isloading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _sendPasswordResetEmail,
                      child: Text('Reset password')),
            ],
          ),
        ));
  }
}
