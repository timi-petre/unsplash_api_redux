import 'package:redux/redux.dart';
import 'package:redux_app/src/actions/get_images.dart';
import 'package:redux_app/src/models/app_state.dart';

Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
  TypedReducer<AppState, GetImages>(_getImages),
  TypedReducer<AppState, GetImagesSuccessful>(_getImagesSuccessful),
  TypedReducer<AppState, GetImagesError>(_getImagesError),
]);

AppState _getImages(AppState state, GetImages action) {
  return state.copyWith(
    isLoading: true,
  );
}

AppState _getImagesSuccessful(AppState state, GetImagesSuccessful action) {
  final List<String> images = <String>[
    ...action.images,
    ...state.images,
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
