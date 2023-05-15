import 'dart:typed_data';

import 'package:cat_facts/data/cat_fact.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:retrofit/retrofit.dart';

part 'cat_fact_repository.g.dart';

class CatFactRepository {
  CatFactRepository._();

  static final instance = CatFactRepository._();

  Future<Uint8List> fetchCatImage() async {
    final url = Uri.parse("https://cataas.com/cat");
    final response = await http.get(url);
    return response.bodyBytes;
  }
}

@RestApi(baseUrl: "https://catfact.ninja")
abstract class CatFactService {
  factory CatFactService(Dio dio, {String baseUrl}) = _CatFactService;

  @GET("/fact")
  Future<CatFact> getRandomFact();
}
