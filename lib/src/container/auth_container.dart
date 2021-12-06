import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '/src/models/user_state.dart';

class AuthContainer extends StatelessWidget {
  const AuthContainer({Key? key, required this.builder}) : super(key: key);
  final ViewModelBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<UserState, String>(
      converter: (Store<UserState> store) => store.state.text,
      builder: builder,
    );
  }
}
