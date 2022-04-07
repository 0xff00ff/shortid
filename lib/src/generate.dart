import 'package:shortid/src/alphabet.dart' as alphabet;
import 'package:shortid/src/format.dart';

import 'dart:math';

const default_srting_len = 7;

/// Generates an unique string with set length
String generate(int? number) {
  var loopCounter = 0;
  var done = false;
  
  final len = number ?? default_srting_len;

  final str = new StringBuffer();

  while (!done) {
    str.write(format(alphabet.get(), 1));
    done = len < pow(16, loopCounter + 1);
    loopCounter++;
  }
  return str.toString();
}
