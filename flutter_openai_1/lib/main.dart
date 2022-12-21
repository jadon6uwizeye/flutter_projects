// ignore_for_file: prefer_const_constructors, unused_element, prefer_final_fields, library_private_types_in_public_api, import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final apiKey = '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';
  final apiUrl = 'https://api.openai.com/v1';

  String _response = '';
  TextEditingController _questionController = TextEditingController();

  Future<void> _askQuestion() async {
    try {
      String question = _questionController.text;
      if (question.isEmpty) return;
      _questionController.clear();
      setState(() {
        _response = 'Asking question...';
      });
      final response = await http.post(
        Uri.parse('$apiUrl/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'text-davinci-002',
          'prompt': question,
          'max_tokens': 128,
        }),
      );
      if (response.statusCode == 200) {
        setState(() {
          _response = jsonDecode(response.body)['choices'][0]['text'];
        });
      } else {
        setState(() {
          _response = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _response = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OpenAI API Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _questionController,
                decoration: InputDecoration(
                  hintText: 'Enter your question',
                ),
              ),
              SizedBox(height: 16.0),
              // add action button to send request
              ElevatedButton(
                onPressed: _askQuestion,
                child: Text('Ask'),
              ),
              // FlatButton(
              //   onPressed: _askQuestion,
              //   child: Text('Ask'),
              // ),
              SizedBox(height: 16.0),
              Text(_response),
            ],
          ),
        ),
      ),
    );
  }
}
