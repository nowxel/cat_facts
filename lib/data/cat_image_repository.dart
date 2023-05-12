import 'dart:io';

class CatImageRepository {
  CatImageRepository._();

  static final instance = CatImageRepository._();

  Future<Uri> fetchRandomImage() async {
    try {
      final url = Uri.parse("https://cataas.com/cat");
      return url;
    } catch (e) {
      throw const SocketException("Something went wrong");
    }
  }
}
