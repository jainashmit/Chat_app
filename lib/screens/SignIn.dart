import 'dart:convert';
import 'package:chat_app/screens/MainPage.dart';
import 'package:chat_app/service/stroageHelper.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/service/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _usernameController = TextEditingController();
  final _passController = TextEditingController();
  String? _username;
  String? _pass;
  bool _isloading = false;

  Future<void> login(String? username, String? pass) async {
    final uri = Uri.parse(UrlConstants.signInUrl);

    final body = jsonEncode({"username": username, "password": pass});

    Response response = await http.post(
      uri,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      setState(() {
        _isloading = false;
      });

      TokenStorage.saveAccessToken(response);
      TokenStorage.saveRefreshToken(response);
      UserStorage.saveUser(username);
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => Mainpage()));
    } else {
      setState(() {
        _isloading = false;
      });
      ScaffoldMessenger(child: SnackBar(content: Text('Wrong Credentials')));
      print('error================');
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Spacer(),
                  Text(
                    'Hello, Welcome Back',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Login To Continue',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Spacer(),
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
                      fillColor: const Color.fromARGB(128, 255, 255, 255),
                    ),
                  ),
                  SizedBox(height: 16),
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
                      fillColor: const Color.fromARGB(128, 255, 255, 255),
                    ),
                  ),
                  // SizedBox(
                  //   height: 8,
                  // ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(128, 255, 255, 255),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  SizedBox(
                    height: 48,
                    width: 360,

                    child: Padding(
                      padding: EdgeInsets.only(left: 39, right: 39),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_pass == null || _username == null) {
                            print('Issue of null');
                            ScaffoldMessenger(
                              child: SnackBar(
                                content: Text('Please fill All fields'),
                              ),
                            );
                          } else {
                            print('processing');
                            print(_username);
                            print(_pass);
                            setState(() {
                              _isloading = true;
                            });
                            login(_username, _pass);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.amber,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          ),
                        ),
                        child:
                            _isloading
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
                  Spacer(),
                  Text(
                    'Or sign in with',
                    style: TextStyle(color: Colors.white),
                  ),

                  SizedBox(height: 16),

                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/Google.png',
                              height: 22,
                              width: 22,
                            ),
                            SizedBox(width: 8),
                            Text('Sign in with Google'),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/img/Facebook.png',
                              height: 22,
                              width: 22,
                            ),
                            SizedBox(width: 8),
                            Text('Sign in with Facebook'),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have account ?',
                        style: TextStyle(color: Colors.white),
                      ),

                      SizedBox(),

                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/signup');
                          //   Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //       builder: (context) {
                          //         return SignUp();
                          //       },
                          //     ),
                          //   );
                        },
                        child: Text(
                          'Sign Up',
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
        ),
      ),
    );
  }
}
