import 'dart:convert';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecommendationsScreen extends StatefulWidget {
  const RecommendationsScreen({super.key});

  @override
  State<RecommendationsScreen> createState() => _RecommendationsScreenState();
}

class _RecommendationsScreenState extends State<RecommendationsScreen> {
  late List<String> _movieList = [];
  final TextEditingController _userIDController = TextEditingController();
  late String _server;
  late Future<List<String>> _futureRecommendations;

  @override
  void initState() {
    super.initState();
    _futureRecommendations = Future<List<String>>.value([]);
    _server = (!kIsWeb && Platform.isAndroid) ? '10.0.2.2' : '127.0.0.1';
  }

  Future<List<String>> recommend() async {
    final response = await http.post(
      Uri.parse('http://$_server:5000/recommend'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'user_id': _userIDController.text,
      }),
    );

    if (response.statusCode == 200) {
      return List<String>.from(jsonDecode(response.body)['movies']);
    } else {
      throw Exception('Error response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            'assets/flutflix.png',
            height: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _userIDController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Digite seu ID de usuário',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _futureRecommendations = recommend();
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 165, 30, 21),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
              child: const Text(
                'Recomendar',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            FutureBuilder<List<String>>(
              future: _futureRecommendations,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    color: Colors.redAccent,
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                } else if (snapshot.hasData) {
                  _movieList = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                      itemCount: _movieList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.grey[850],
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ListTile(
                            leading: SizedBox(
                              width: 50,
                              child: const Icon(Icons.movie,
                                  color: Color.fromARGB(255, 165, 30, 21)),
                            ),
                            title: Text(
                              _movieList[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                            subtitle: const Text(
                              'Filme recomendado',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
