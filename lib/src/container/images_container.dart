import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '/src/models/index.dart';

class ImagesContainer extends StatelessWidget {
  const ImagesContainer({Key? key, required this.builder}) : super(key: key);

  final ViewModelBuilder<List<Photo>> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<Photo>>(
      converter: (Store<AppState> store) => store.state.images,
      builder: builder,
    );
  }
}
