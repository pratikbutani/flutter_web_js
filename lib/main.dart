import 'package:flutter/material.dart';
import 'package:flutter_web_js/js/js_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web + JS',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Web + JS'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final JSHelper _jsHelper = JSHelper();

  String platForm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text(
                "Click to Check Platform",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                getPlatform();
              },
            ),
            const SizedBox(height: 16),
            if (platForm.isNotEmpty) ...[
              Text(
                'Current Platform is : $platForm',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
            ],
            ElevatedButton(
              child: const Text(
                "OpenTab",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                // Loader
                String dataFromJS = await _jsHelper.callOpenTab();
                print("dataFromJS ----------- $dataFromJS");
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text(
                "Call JS Promise Function",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                // Loader
                String dataFromJS = await _jsHelper.callJSPromise();

                print("dataFromJS ----------- $dataFromJS");
              },
            ),
          ],
        ),
      ),
    );
  }

  void getPlatform() {
    setState(() {});
    platForm = _jsHelper.getPlatformFromJS();
    print(platForm);
  }
}
