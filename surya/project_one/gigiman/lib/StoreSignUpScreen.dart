import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class StoreSignUpScreen extends StatefulWidget {
  @override
  _StoreDetailsFormState createState() => _StoreDetailsFormState();
}

class _StoreDetailsFormState extends State<StoreSignUpScreen> {
  // Global key for the form that allows us to validate and save its fields.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  final _storenameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ownernameController = TextEditingController();
  final _empnumController = TextEditingController();
  final _GSTnumController = TextEditingController();
  final _storelocationController = TextEditingController();



  Future<void> _handleRegister() async {
    Map<String, String> userData = {
      'storename': _storenameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'owner': _ownernameController.text,
      'empnum': _empnumController.text,
      'GSTnum': _GSTnumController.text,
      'storelocation': _storelocationController.text,
    };

    final response = await apiService.registerUser( userData
      /*'storename': _storenameController.text,
      'email': _emailController.text,
      'password': _passwordController.text,
      'ownername': _ownernameController.text,
      'empnum': _empnumController.text,
      'GSTnum': _GSTnumController.text,
      'storelocation': _storelocationController.text,*/

    );

    if (response.statusCode == 200) {
      // Successful login
      print("register successful: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("register Successful!")),
      );
    } else {
      // Login failed
      print("register failed: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("register Failed. Please try again.")),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GIGIMAN"),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey, // Assigning the global key to the form.
            child: Column(
              children: [
                Image.asset(
                  'assets/signinstore.png', // Replace with your image path
                  height: 100,
                  width: 120,
                ),
                SizedBox(height: 8),
                // Text field for entering a name.
                TextFormField(
                  controller: _storenameController,
                  decoration: InputDecoration(labelText: "store name"),
                ),
                SizedBox(height: 16),
                // Text field for entering an email.
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: "email"),

                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: "create password"),

                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _ownernameController,
                  decoration: InputDecoration(labelText: "owner name"),

                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _empnumController,
                  decoration: InputDecoration(labelText: "total no of employee"),

                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _GSTnumController,
                  decoration: InputDecoration(labelText: "GST number"),

                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _storelocationController,
                  decoration: InputDecoration(labelText: "location"),

                ),
                SizedBox(height: 16),
                // Submit button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                  onPressed: ()  async {
                    print("Button clicked! Navigating to the second page.");
                     await _handleRegister();
                  },
                  child: Text("Submit"),

                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
