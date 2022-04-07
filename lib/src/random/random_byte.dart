import 'dart:math';

/// returns a random bytes with set length
List<int> randomByte(int size) {
  final bytes = <int>[];
  for (var i = 0; i < size; i++) {
    bytes.add((new Random().nextDouble() * 256).floor());
  }
  return bytes;
}
