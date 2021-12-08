import 'package:redux/redux.dart';

import '/src/actions/index.dart';
import '/src/models/index.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetImagesStart>(_getImages),
  TypedReducer<AppState, GetImagesSuccessful>(_getImagesSuccessful),
  TypedReducer<AppState, GetImagesError>(_getImagesError),
]);

AppState _getImages(AppState state, GetImagesStart action) {
  return state.copyWith(
    isLoading: true,
  );
}

AppState _getImagesSuccessful(AppState state, GetImagesSuccessful action) {
  final List<Photo> images = <Photo>[
    ...state.images,
    ...action.images,
  ];
  return state.copyWith(
    images: images,
    page: state.page + 1,
    isLoading: false,
  );
}

AppState _getImagesError(AppState state, GetImagesError action) {
  return state.copyWith(
    isLoading: false,
  );
}
