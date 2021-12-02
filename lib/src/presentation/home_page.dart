import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_app/src/actions/get_images.dart';
import 'package:redux_app/src/container/images_container.dart';
import 'package:redux_app/src/container/is_loading_container.dart';
import 'package:redux_app/src/models/app_state.dart';

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
        builder: (context) {
          return AlertDialog(
            title: const Text('Error getting images'),
            content: Text('${action.error}'),
          );
        },
      );
    }
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
        actions: <Widget>[
          IsLoadingContainer(
            builder: (BuildContext context, bool isLoading) {
              if (!isLoading) {
                return const SizedBox.shrink();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
      body: ImagesContainer(
        builder: (BuildContext context, List<String> images) {
          return ListView.builder(
            controller: _controller,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              final String image = images[index];
              return ListTile(
                leading: Image.asset(image),
              );
            },
          );
        },
      ),
    );
  }
}
