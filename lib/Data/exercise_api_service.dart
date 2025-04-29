import 'dart:convert';
import 'package:http/http.dart' as http;

class ExerciseApiService {
  final String _baseUrl = 'https://exercisedb.p.rapidapi.com';
  final Map<String, String> _headers = {
    'X-RapidAPI-Key': 'ec912af2camshd92b345ac53b27ap1c8019jsne25582929b06',
    'X-RapidAPI-Host': 'exercisedb.p.rapidapi.com',
  };

  Future<List<dynamic>> fetchAllExercises() async {
    final url = Uri.parse('$_baseUrl/exercises');
    final response = await http.get(url, headers: _headers);

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Fehler beim Laden der Daten');
    }
  }
}