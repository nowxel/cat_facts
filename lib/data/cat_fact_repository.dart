import 'dart:convert';
import 'dart:io';

import 'package:cat_facts/data/cat_fact.dart';
import 'package:http/http.dart' as http;

class CatFactRepository {
  CatFactRepository._();

  static final instance = CatFactRepository._();

  Future<CatFact> fetchRandomFact() async {
    try {
      final url = Uri.parse("https://catfact.ninja/fact");
      final response = await http.get(url);
      final json = jsonDecode(response.body);
      return CatFact.fromJson(json);
    } catch (e) {
      throw const SocketException("Something went wrong");
    }
  }
}
