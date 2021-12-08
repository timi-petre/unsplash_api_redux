import 'dart:convert';

import 'package:http/http.dart';

import '/src/models/index.dart';

class ImagesApi {
  Future<List<Photo>> getImages(int page, String avatar) async {
    final Uri uri = Uri(
      scheme: 'https',
      host: 'api.unsplash.com',
      pathSegments: <String>[
        'users',
        'hans_isaacson',
        'photos',
      ],
      queryParameters: <String, String>{
        'client_id': '4SzXVATPhpl4SaGjnz3qQcYjXnKqsjILsN_TznROKrY',
        'page': '$page',
        'per_page': '6',
        'limit': '10',
      },
    );

    final Response response = await get(uri);
    if (response.statusCode != 200) {
      throw StateError('Error fetching the images.');
    }
    final List<dynamic> body = jsonDecode(response.body) as List<dynamic>;

    return body //
        .map((dynamic image) => Photo(
              image: '${image['urls']['small']}',
              description: '${image['description']}',
            )) //
        .toList();
  }
}
