/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkUtils {
  // Check internet connection
  static Future<bool> isConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // GET request helper
  static Future<Map<String, dynamic>> getRequest(String url) async {
    if (!await isConnected()) {
      throw Exception("No Internet Connection");
    }

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(
          "Failed to fetch data. Status code: ${response.statusCode}");
    }
  }

  // POST request helper
  static Future<Map<String, dynamic>> postRequest(
      String url, Map<String, dynamic> body) async {
    if (!await isConnected()) {
      throw Exception("No Internet Connection");
    }

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: json.encode(body),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception(
          "Failed to post data. Status code: ${response.statusCode}");
    }
  }

  // Handle API errors in UI
  static void showErrorSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
*/