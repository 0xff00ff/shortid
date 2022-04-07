import 'package:shortid/src/random/random_from_seed.dart' as random_from_seed;
import 'package:shortid/src/error.dart';

const _ORIGINAL =
    '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-';

String _alphabet = '';
double _previousSeed = -1;
String _shuffled = '';

/// returns selected for generation characters
String get() {
  if (_alphabet == '') {
    return _ORIGINAL;
  }
  return _alphabet;
}

/// returns one character from shuffled characters
String lookup(int index) {
  final alphabetShuffled = shuffled();
  return alphabetShuffled[index];
}

/// resets shuffled characters
void reset() {
  _shuffled = '';
}

/// uses custom characters for id generation
void setCharacters(String alphabet) {
  if (alphabet.isEmpty) {
    if (_alphabet != _ORIGINAL) {
      _alphabet = _ORIGINAL;
      reset();
    }
    return null;
  }

  if (alphabet == _alphabet) {
    return null;
  }

  final unique = alphabet.split('').toSet();

  if (unique.length != alphabet.length) {
    throw new ShortIdError('Custom alphabet for shortid must be ' +
        _ORIGINAL.length.toString() +
        ' unique characters. found: ' +
        unique.length.toString());
  }

  _alphabet = alphabet;
  reset();
}

/// returns used characters for id generation
String characters(String alphabet) {
  setCharacters(alphabet);
  return _alphabet;
}

/// uses an double to seed randomizer
void seed(double seed) {
  random_from_seed.seed(seed);
  if (_previousSeed != seed) {
    reset();
    _previousSeed = seed;
  }
}

/// shuffless the existing alphabet 
String shuffle() {
  if ('' == _alphabet) {
    setCharacters(_ORIGINAL);
  }
  final shuffled = _alphabet.split('');
  shuffled.shuffle();
  return shuffled.join('');
}

/// returns shaffled alphabet
String shuffled() {
  if ('' != _shuffled) {
    return _shuffled;
  }
  return _shuffled = shuffle();
}
