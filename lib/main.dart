import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/src/data/images_api.dart';
import 'package:redux_app/src/epics/app_epics.dart';
import 'package:redux_app/src/models/app_state.dart';
import 'package:redux_app/src/presentation/home_page.dart';
import 'package:redux_app/src/reducer/reducer.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {
  final ImagesApi moviesApi = ImagesApi();
  final AppEpics epics = AppEpics(moviesApi);

  final Store<AppState> store = Store<AppState>(
    reducer,
    initialState: AppState(),
    middleware: <Middleware<AppState>>[
      (Store<AppState> store, dynamic action, NextDispatcher next) {
        next(action);
      },
      EpicMiddleware<AppState>(epics.epics),
    ],
  );
  //store.dispatch(const GetMovies(1)); emitem o actiune
  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const MyHomePage(),
      ),
    );
  }
}
