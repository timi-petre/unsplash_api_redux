import 'dart:convert';

import 'package:http/http.dart';

class ImagesApi {
  Future<List<String>> getImages(int page) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: '',
      pathSegments: <String>[],
      queryParameters: <String, String>{
        'page': '$page',
      },
    );

    final Response response = await get(uri);
    if (response.statusCode != 200) {
      throw StateError('Error fetching the images.');
    }
    final Map<String, dynamic> body = jsonDecode(response.body);
    final Map<String, dynamic> data = body['data'] as Map<String, dynamic>;
    final List<dynamic> movies = data['movies'] as List<dynamic>;

    return movies //
        .map((dynamic item) => item['title'] as String)
        .toList();
  }
}
