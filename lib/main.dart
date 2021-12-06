import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import '/src/presentation/login_page.dart';
import '/src/presentation/users_page.dart';
import 'src/data/images_api.dart';
import 'src/epics/app_epics.dart';
import 'src/models/app_state.dart';
import 'src/presentation/home_page.dart';
import 'src/reducer/reducer.dart';

void main() {
  final ImagesApi imagesApi = ImagesApi();
  final AppEpics epics = AppEpics(imagesApi);

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

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.store}) : super(key: key);
  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: '/photos',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const LoginPage(),
          '/users': (BuildContext context) => const UsersPage(),
          '/photos': (BuildContext context) => const MyHomePage(),
        },
      ),
    );
  }
}
