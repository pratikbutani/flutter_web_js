@JS()
library script.js;

import 'package:js/js.dart';

// This function will do Promise to return something
@JS()
external dynamic jsPromiseFunction(String message);

// This function will open new popup window for given URL.
@JS()
external dynamic jsOpenTabFunction(String url);

///         ^            ^                ^
///      return     functionName       arguments
