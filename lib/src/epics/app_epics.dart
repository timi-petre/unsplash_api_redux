import 'package:redux_app/src/actions/get_images.dart';
import 'package:redux_app/src/data/images_api.dart';
import 'package:redux_app/src/models/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AppEpics {
  AppEpics(this._api);

  final ImagesApi _api;

  Epic<AppState> get epics => combineEpics<AppState>([
        TypedEpic<AppState, GetImages>(getImages),
      ]);

  Stream<dynamic> getImages(Stream<GetImages> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((GetImages action) => Stream<void>.value(null)
            .asyncMap((_) => _api.getImages(store.state.username))
            .map<Object>((List<String> images) => GetImagesSuccessful(images))
            .onErrorReturnWith((error, stackTrace) => GetImagesError(error))
            .doOnData(action.result));
  }
}
