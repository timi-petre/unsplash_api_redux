import 'dart:convert';

import 'package:http/http.dart';

class ImagesApi {
  Future<List<String>> getImages(String username, int _page) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'api.unsplash.com',
      pathSegments: <String>[
        'users',
        username,
        'photos',
      ],
      queryParameters: <String, String>{
        'username': 'hans_isaacson',
        'client_id': 'zv3SvfPMt52mH9vESdKdQK2YMP4b-QsAVSB838MHBZo',
        'page': '$_page',
        'count': '4',
        'orientation': 'landscape',
      },
    );

    final Response response = await get(uri);
    if (response.statusCode != 200) {
      throw StateError('Error fetching the images.');
    }
    final List<dynamic> body = jsonDecode(response.body);
    return body //
        .map((dynamic image) => image['urls']['small'] as String)
        .toList();
  }
}
