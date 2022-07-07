import 'dart:js' as js;

import 'package:js/js_util.dart';

import 'js_library.dart';

class JSHelper {
  /// This method name inside 'getPlatform' should be same in JavaScript file
  String getPlatformFromJS() {
    return js.context.callMethod('getPlatform');
  }

  Future<String> callJSPromise() async {
    return await promiseToFuture(jsPromiseFunction("I am back from JS"));
  }

  Future<String> callOpenTab() async {
    return await promiseToFuture(jsOpenTabFunction('https://google.com/'));
  }
}
