import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

import '/src/actions/index.dart';
import '/src/data/images_api.dart';
import '/src/models/index.dart';

class AppEpics {
  AppEpics(this._api);

  final ImagesApi _api;

  Epic<AppState> get epics => combineEpics<AppState>(<Epic<AppState>>[
        TypedEpic<AppState, GetImagesStart>(getImages),
      ]);

  Stream<AppAction> getImages(Stream<GetImagesStart> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((GetImagesStart action) => Stream<void>.value(null)
            .asyncMap((_) => _api.getImages(store.state.page, store.state.avatar))
            .map((List<Photo> images) => GetImages.successful(images))
            .onErrorReturnWith((Object error, StackTrace stackTrace) => GetImages.error(error, stackTrace))
            .doOnData(action.result));
  }
}
