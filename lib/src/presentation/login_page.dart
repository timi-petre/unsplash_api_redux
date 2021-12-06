import 'package:flutter/material.dart';
import '/src/container/auth_container.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController textController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthContainer(
        builder: (BuildContext context, String errortext) {
          return SafeArea(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        autofocus: true,
                        keyboardType: TextInputType.emailAddress,
                        controller: textController,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.email,
                          ),
                          errorText: errortext,
                          hintText: 'Email',
                          suffix: IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                errortext = '';
                              });
                              textController.clear();
                            },
                          ),
                        ),
                      ),
                      ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          final String? value = textController.text;
                          final String? value2 = passController.text;
                          final bool result2 = value2?.isEmpty ?? true;
                          final bool result = value?.isEmpty ?? true;
                          setState(() {
                            if (result) {
                              errortext = 'Please enter a valid email';
                            } else if (result2) {
                              errortext = 'Please enter a valid password';
                            } else {
                              errortext = '';
                              errortext = '';
                              Navigator.pushNamed(
                                context,
                                '/users',
                              );
                            }
                          });
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
