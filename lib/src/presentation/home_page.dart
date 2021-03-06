import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '/src/actions/index.dart';
import '/src/container/avatar_container.dart';
import '/src/container/images_container.dart';
import '/src/container/is_loading_container.dart';
import '/src/container/username_container.dart';
import '/src/models/index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    stateApp();
  }

  void stateApp() {
    final Store<AppState> store = StoreProvider.of<AppState>(context, listen: false);

    store.dispatch(GetImages(onResult));
    _controller.addListener(_onScroll);
  }

  void _onScroll() {
    final double currentPosition = _controller.offset;
    final double maxPosition = _controller.position.maxScrollExtent;

    final Store<AppState> store = StoreProvider.of<AppState>(context);

    if (!store.state.isLoading && currentPosition > maxPosition - MediaQuery.of(context).size.height) {
      store.dispatch(GetImages(onResult));
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double expand = 250.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _controller,
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: expand,
              backgroundColor: Colors.grey[850],
              flexibleSpace: const FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: UserName(),
                background: Avatar(),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Container(
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
            ),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 10,
              ),
            ),
            ImagesContainer(builder: (BuildContext context, List<Photo> images) {
              return SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final Photo image = images[index];
                      return Column(
                        children: <Widget>[
                          ImagesContainer(
                            builder: (BuildContext context, List<Photo> images) {
                              return Column(
                                children: <Widget>[
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      image.image,
                                      fit: BoxFit.cover,
                                      height: 145,
                                      width: double.infinity,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(image.description ?? 'No description'),
                                ],
                              );
                            },
                          ),
                        ],
                      );
                    },
                    childCount: images.length,
                  ),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                  ),
                ),
              );
            }),
            SliverFillRemaining(
              child: Center(
                child: IsLoadingContainer(
                  builder: (BuildContext context, bool isLoading) {
                    if (!isLoading) {
                      return const SizedBox.shrink();
                    }
                    return const CircularProgressIndicator(
                      color: Colors.amber,
                    );
                  },
                ),
              ),
            ),
          ],
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
          username.replaceAll(
              username, (username.substring(0, 1).toUpperCase() + username.substring(1)).replaceRange(4, 5, ' ')),
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
    return AvatarContainer(
      builder: (BuildContext context, String avatar) {
        return CircleAvatar(
          backgroundColor: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              avatar,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}
