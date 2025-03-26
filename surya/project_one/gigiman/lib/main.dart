import 'package:flutter/material.dart';
import 'SignUpScreen.dart';
import 'dart:async';
import '../services/api_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFFC9077),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFFC9077),
          secondary: Colors.orange, // Optional customization
        ),
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  /*Future<void> _handleLogin(dynamic apiService) async {
    final response = await apiService.loginUser(
      _emailController.text,
      _passwordController.text,
    );

    if (response.statusCode == 200) {
      // Successful login
      print("Login successful: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Successful!")),
      );
    } else {
      // Login failed
      print("Login failed: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed. Please try again.")),
      );
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFC9077), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'GIGIMAN',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'Castellar',
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFC9077)
                  ),
                ),
                SizedBox(height: 8),
                Text('login',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFC9077)
                  )),
                SizedBox(height: 8,),
                Text(
                  'Welcome Back',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                SizedBox(height: 32),
                TextField(controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email or Phone number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Forgot Password?',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                   // _handleLogin;
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFC9077),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  ),
                  child: Text('Login', style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                        },
                        child: Text(
                          "sign up",
                          style: TextStyle(
                            color: Color(0xFFFC9077),
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Continue with social media',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(height: 16),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      child: Text('Facebook'),
                    ),
                    SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      ),
                      child: Text('google'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
