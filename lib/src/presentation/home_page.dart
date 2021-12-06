import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '/src/actions/get_images.dart';
import '/src/container/avatar_container.dart';
import '/src/container/images_container.dart';
import '/src/container/is_loading_container.dart';
import '/src/container/username_container.dart';
import '/src/models/app_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();
  int index = 0;
  @override
  void initState() {
    super.initState();
    stateApp();
  }

  void stateApp() {
    final Store<AppState> store = StoreProvider.of<AppState>(context, listen: false);

    store.dispatch(GetImages(onResult, username));
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final double currentPosition = _controller.offset;
    final double maxPosition = _controller.position.maxScrollExtent;

    final Store<AppState> store = StoreProvider.of<AppState>(context);

    if (!store.state.isLoading && currentPosition > maxPosition - MediaQuery.of(context).size.height) {
      store.dispatch(GetImages(onResult, username));
    }
  }

  void onResult(dynamic action) {
    if (action is GetImagesError) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error getting images'),
            content: Text('${action.error}'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }
    return;
  }

  void username(dynamic action) {
    if (action is GetImagesError) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error getting images'),
            content: Text('${action.error}'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }
    return;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Images App'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          stateApp();
        },
        child: SafeArea(
          child: ImagesContainer(
            builder: (BuildContext context, List<String> images) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    const Avatar(),
                    const SizedBox(
                      height: 16.0,
                    ),
                    const UserName(),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 1,
                        right: 1,
                        bottom: 5,
                      ),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        width: MediaQuery.of(context).size.width,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[850],
                          border: Border.all(width: 5, color: Colors.white),
                        ),
                        child: const Center(
                          child: Text(
                            'Photos',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/image', arguments: images[index]);
                        },
                        child: GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          controller: _controller,
                          padding: const EdgeInsets.all(16),
                          shrinkWrap: true,
                          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                          ),
                          itemCount: images.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.network(
                                images[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    IsLoadingContainer(
                      builder: (BuildContext context, bool isLoading) {
                        if (!isLoading && images.isNotEmpty) {
                          return const SizedBox.shrink();
                        }
                        return const CircularProgressIndicator(
                          color: Colors.amber,
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, String username) {
        return Text(
          username,
          style: const TextStyle(fontSize: 20),
        );
      },
    );
  }
}

class Avatar extends StatelessWidget {
  const Avatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.amber,
      radius: 50,
      child: AvatarContainer(
        builder: (BuildContext context, String avatar) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              avatar,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          );
        },
      ),
    );
  }
}
