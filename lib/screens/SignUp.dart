import 'dart:convert';

import 'package:chat_app/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  String? _email;
  String? _username;
  String? _pass;
  bool _isloading = false;

  Future<void> register(String? email, String? username, String? pass) async {
    final uri = Uri.parse(UrlConstants.signUpUrl);

    final body = jsonEncode({
      "email": email,
      "username": username,
      "password": pass,
    });
    print('uri ======= $uri');

    Response response = await http.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    print('response.statuscode ======== ${response.statusCode}');
    if (response.statusCode == 200) {
      setState(() {
        _isloading = false;
        AlertDialog(content: Text('SignUp Successfull Please SignIn') ,);
        Navigator.pop(context);
      });
    } else {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger(
        child: SnackBar(
          content: Text(
            'Wrong Credentials',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
      );
      print('error================');
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Spacer(),
              Text(
                'Welcome to Let\'s Chat ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                'Register Here',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: _emailController,
                onChanged: (value) {
                  setState(() {
                    _email = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'E-Mail',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(128, 255, 255, 255),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _usernameController,
                onChanged: (value) {
                  setState(() {
                    _username = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(128, 255, 255, 255),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: _passController,
                onChanged: (value) {
                  setState(() {
                    _pass = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(128, 255, 255, 255),
                ),
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.only(left: 49, right: 49),
                child: SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if(_email == null || _username == null || _pass == null){
                        ScaffoldMessenger(
                          child: SnackBar(
                            content: Text(
                              'Wrong Credentials',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black,
                          ),
                        );
                      }else{
                        setState(() {
                        _isloading = true;
                      });
                      register(_email, _username, _pass);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                    child:  _isloading
                                ? Padding(
                                  padding: EdgeInsets.all(6),
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                  ),
                                )
                                : Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already Have Account?',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'SignIn',
                      style: TextStyle(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
