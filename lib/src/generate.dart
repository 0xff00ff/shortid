import 'package:shortid/src/alphabet.dart' as alphabet;
import 'package:shortid/src/format.dart';

import 'dart:math';

String generate(int number) {
  var loopCounter = 0;
  var done = false;

  final str = new StringBuffer();

  while (!done) {
    str.write(format(alphabet.get(), 1));
    done = number < pow(16, loopCounter + 1);
    loopCounter++;
  }
  return str.toString();
}
