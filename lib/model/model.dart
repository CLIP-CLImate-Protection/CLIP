import 'package:firebase_ml_model_downloader/firebase_ml_model_downloader.dart';
import 'package:flutter/material.dart';

const kModelName = "yolov8";


class Model extends StatefulWidget {
  const Model({Key? key}) : super(key: key);
  static const String url = '/model/model.dart';

  @override
  State<Model> createState() => _ModelState();
}

class _ModelState extends State<Model> {
  @override
  void initState() {
    super.initState();
    initWithLocalModel();
  }

  FirebaseCustomModel? model;

  /// Initially get the lcoal model if found, and asynchronously get the latest one in background.
  initWithLocalModel() async {
    final _model = await FirebaseModelDownloader.instance.getModel(
        kModelName, FirebaseModelDownloadType.localModelUpdateInBackground);

    setState(() {
      model = _model;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: model != null
                          ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Model name: ${model!.name}'),
                          Text('Model size: ${model!.size}'),
                        ],
                      )
                          : const Text("No local model found"),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          final _model = await FirebaseModelDownloader.instance
                              .getModel(kModelName,
                              FirebaseModelDownloadType.latestModel);

                          setState(() {
                            model = _model;
                          });
                        },
                        child: const Text('Get latest model'),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await FirebaseModelDownloader.instance
                              .deleteDownloadedModel(kModelName);

                          setState(() {
                            model = null;
                          });
                        },
                        child: const Text('Delete local model'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}