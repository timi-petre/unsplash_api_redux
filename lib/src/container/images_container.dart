import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '/src/models/app_state.dart';

class ImagesContainer extends StatelessWidget {
  const ImagesContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<List<String>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<String>>(
      converter: (Store<AppState> store) => store.state.images,
      builder: builder,
    );
  }
}
