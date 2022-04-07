import 'package:shortid/src/random/random_byte.dart';
import 'dart:math';

/// returns generated part of id
String format(String alphabet, int size) {
  final mask = (2 << log(alphabet.length - 1) ~/ ln2) - 1;
  final step = (1.6 * mask * size / alphabet.length).ceil();

  var id = '';
  const faker = true;
  while (faker) {
    final bytes = randomByte(step);
    for (var i = 0; i < step; i++) {
      final byte = bytes[i] & mask;
      if (byte > 0 && alphabet.length > byte) {
        id += alphabet[byte];
        if (id.length == size) {
          return id;
        }
      }
    }
  }
  return '';
}
