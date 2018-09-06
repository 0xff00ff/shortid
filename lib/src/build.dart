import 'package:shortid/src/generate.dart';

// Ignore all milliseconds before a certain time to reduce the size of the date entropy without sacrificing uniqueness.
// This number should be updated every year or so to keep the generated id short.
// To regenerate `new Date() - 0` and bump the version. Always bump the version!
const _REDUCE_TIME = 1459707606518;

// don't change unless we change the algos or REDUCE_TIME
// must be an integer and less than 16
const _version = 6;

// Counter is used when shortid is called multiple times in one second.
int counter;

// Remember the last time shortid was called in case counter is needed.
int previousSeconds;

/// Generate unique id
/// Returns string id
String build(int clusterWorkerId) {
  var str = '';

  final seconds =
      ((DateTime.now().millisecondsSinceEpoch - _REDUCE_TIME) * 0.001).floor();

  if (seconds == previousSeconds) {
    counter++;
  } else {
    counter = 0;
    previousSeconds = seconds;
  }

  str = str + generate(_version);
  str = str + generate(clusterWorkerId);
  if (counter > 0) {
    str = str + generate(counter);
  }
  return str + generate(seconds);
}
