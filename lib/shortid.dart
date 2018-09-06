import 'package:shortid/src/alphabet.dart' as alphabet;
import 'package:shortid/src/build.dart';

// for future
int _clusterWorkerId = 0;

class _Shortid {

  /// Set the seed.
  /// Highly recommended if you don't want people to try to figure out your id schema.
  /// exposed as shortid.seed(int)
  /// @param seed Integer value to seed the random alphabet.  ALWAYS USE THE SAME SEED or you might get overlaps.
  _Shortid seed(double seedValue) {
    alphabet.seed(seedValue);
    return this;
  }

  /// Set the cluster worker or machine id
  /// exposed as shortid.worker(int)
  /// @param workerId worker must be positive integer.  Number less than 16 is recommended.
  /// returns shortid module so it can be chained.
  _Shortid worker(int workerId) {
    _clusterWorkerId = workerId;
    return this;
  }

  /// sets new characters to use in the alphabet
  /// returns the shuffled alphabet
  String characters(String newCharacters) {
    if (newCharacters != null) {
      alphabet.characters(newCharacters);
    }

    return alphabet.shuffled();
  }

  /// Generate unique id
  /// Returns string id
  String generate() => build(_clusterWorkerId);
}

_Shortid shortid = new _Shortid();
