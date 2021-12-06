import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

import '/src/actions/get_images.dart';
import '/src/data/images_api.dart';
import '/src/models/app_state.dart';

class AppEpics {
  AppEpics(this._api);

  final ImagesApi _api;

  Epic<AppState> get epics => combineEpics<AppState>(<Epic<AppState>>[
        TypedEpic<AppState, GetImages>(getImages),
      ]);

  Stream<dynamic> getImages(Stream<GetImages> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((GetImages action) => Stream<void>.value(null)
            .asyncMap((_) => _api.getImages(store.state.username, store.state.page, store.state.avatar))
            .map<Object>((List<String> images) => GetImagesSuccessful(images))
            .onErrorReturnWith((Object error, StackTrace stackTrace) => GetImagesError(error))
            .doOnData(action.result));
  }
}
