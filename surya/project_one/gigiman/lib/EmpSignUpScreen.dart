import 'package:flutter/material.dart';

class EmpSignUpScreen extends StatefulWidget {
  @override
  _EmpDetailsFormState createState() => _EmpDetailsFormState();
}

class _EmpDetailsFormState extends State<EmpSignUpScreen> {
  // Global key for the form that allows us to validate and save its fields.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables to store form data.
  String Empname = "";
  String contactno = "";
  String address = "";
  String aadharno = "";



  // This function is called when the form is submitted.
  // It validates the input, saves the form fields, and then uses the data.
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // For demonstration, print the data and show a snackbar.
      print("storename: $Empname, ownername: $aadharno");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Data collected: Name is $Empname, Email is $aadharno")),
      );
      // Here you can process the form data further if needed.
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
                  'assets/signinemp.png', // Replace with your image path
                  height: 100,
                  width: 120,
                ),
                SizedBox(height: 8),
                // Text field for entering a name.
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      color: Colors.blueAccent, // Label color
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Enter your full name',
                    hintStyle: TextStyle(
                      color: Colors.grey, // Hint color
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Border color when not focused
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Border color when focused
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.person, color: Colors.blueAccent), // Person icon
                    filled: true,
                    fillColor: Colors.blueAccent.withOpacity(0.1), // Light background color
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    Empname = value ?? "";
                  },
                ),

                SizedBox(height: 16),
                TextFormField(
                  keyboardType: TextInputType.phone, // Ensures the number keypad opens
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
                    labelStyle: TextStyle(
                      color: Colors.blue, // Label color
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Enter your contact number',
                    hintStyle: TextStyle(
                      color: Colors.grey, // Hint color
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Border color when not focused
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Border color when focused
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.phone, color: Colors.orange), // Phone icon
                    filled: true,
                    fillColor: Colors.blueAccent.withOpacity(0.1), // Light background color
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact number';
                    } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) { // Numeric validation
                      return 'Please enter a valid number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    contactno = value ?? "";
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Address',
                    labelStyle: TextStyle(
                      color: Colors.blueAccent, // Label color
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Enter your complete address',
                    hintStyle: TextStyle(
                      color: Colors.grey, // Hint color
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Border color when not focused
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blue, // Border color when focused
                        width: 2.0,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.blueAccent.withOpacity(0.1), // Light background color
                    prefixIcon: Icon(Icons.location_on, color: Colors.blueAccent), // Location icon
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                  maxLines: 3, // Allows multiline input
                  keyboardType: TextInputType.multiline,
                  onSaved: (value) {
                    address = value ?? "";
                  },
                ),
                SizedBox(height: 16),


                // Text field for entering an email.
                TextFormField(
                  keyboardType: TextInputType.number, // Opens numeric keypad
                  decoration: InputDecoration(
                    labelText: 'Aadhaar Number',
                    labelStyle: TextStyle(
                      color: Colors.blueAccent, // Label color
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    hintText: 'Enter your 12-digit Aadhaar number',
                    hintStyle: TextStyle(
                      color: Colors.grey, // Hint color
                      fontStyle: FontStyle.italic,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent, // Border color when not focused
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.blueAccent.shade700, // Border color when focused
                        width: 2.0,
                      ),
                    ),
                    prefixIcon: Icon(Icons.credit_card, color: Colors.teal), // Aadhaar card icon
                    filled: true,
                  ),
                  maxLength: 12, // Restricts input to 12 characters
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Aadhaar number';
                    } else if (!RegExp(r'^\d{12}$').hasMatch(value)) { // Aadhaar must be 12 digits
                      return 'Please enter a valid 12-digit Aadhaar number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    address = value ?? "";
                  },
                ),
                SizedBox(height: 16),
                // Submit button
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFFFC9077)),
                  onPressed: _submitForm,
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
