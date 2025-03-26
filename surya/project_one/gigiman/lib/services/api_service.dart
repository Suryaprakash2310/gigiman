import 'dart:convert'; // For JSON encoding and decoding
import 'package:http/http.dart' as http;
import 'dart:async';

class ApiService {
  final String baseUrl = "http://localhost:5000"; // Replace with your server URL

  // Function to register a user
  Future<http.Response> registerUser(Map<String, String> userData) async {
    final Uri url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(userData),
    );
    print("data comes to the api service");
    return response; // Return the response object to handle it in the UI
  }

  // Function to login a user
  Future<http.Response> loginUser(String email, String password) async {
    final Uri url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": email, "password": password}),
    );
    return response; // Return the response object
  }
}