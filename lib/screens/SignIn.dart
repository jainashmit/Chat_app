import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
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
                        color: Colors.white.withOpacity(0.6),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),

                SizedBox(
                  height: 48,
                  width: double.infinity,

                  child: Padding(
                    padding: EdgeInsets.only(left: 39, right: 39),
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) {
                        //       return Homepage();
                        //     },
                        //   ),
                        // );
                        Navigator.of(context).pushReplacementNamed('/main');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                      child: Text(
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
                Text('Or sign in with', style: TextStyle(color: Colors.white)),

                SizedBox(height: 16),

                SizedBox(
                  height: 48,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(left: 27, right: 27),
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
                    padding: EdgeInsets.only(left: 27, right: 27),
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
    );
  }
}
