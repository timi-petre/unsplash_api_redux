import 'dart:convert';

import 'package:http/http.dart';

class ImagesApi {
  Future<List<String>> getImages(String username) async {
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
        'client_id': '4SzXVATPhpl4SaGjnz3qQcYjXnKqsjILsN_TznROKrY',
      },
    );
    print(uri);
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

Future<void> main() async {
  final ImagesApi api = ImagesApi();
  var photos = await api.getImages('hans_isaacson');
  print(photos);
}
