import 'package:shortid/src/random/random-from-seed.dart' as random_from_seed;
import 'package:shortid/src/error.dart';

const _ORIGINAL =
    '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-';

String _alphabet;
double _previousSeed;
String _shuffled;

String get() {
  if (_alphabet == null) {
    return _ORIGINAL;
  }
  return _alphabet;
}

String lookup(int index) {
  final alphabetShuffled = shuffled();
  return alphabetShuffled[index];
}

void reset() {
  _shuffled = null;
}

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

  // removed forced limitations 
  /*
  if (alphabet.length != _ORIGINAL.length) {
    throw new ShortIdError('Custom alphabet for shortid must be ' +
        _ORIGINAL.length.toString() +
        ' unique characters. You submitted ' +
        alphabet.length.toString() +
        ' characters: ' +
        alphabet);
  }
  */

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

String characters(String alphabet) {
  setCharacters(alphabet);
  return _alphabet;
}

void seed(double seed) {
  random_from_seed.seed(seed);
  if (_previousSeed != seed) {
    reset();
    _previousSeed = seed;
  }
}

String shuffle() {
  if (null == _alphabet) {
    setCharacters(_ORIGINAL);
  }

  /*
    var sourceArray = _alphabet.split('');
    var targetArray = <String>[];
    var r = randomFromSeed.nextValue();
    var characterIndex;

    while (sourceArray.length > 0) {
        r = randomFromSeed.nextValue();
        characterIndex = (r * sourceArray.length).floor();
        String result = sourceArray[characterIndex];
        sourceArray.removeAt(characterIndex);
        targetArray.add(result);
    }
    return targetArray.join('');
    */
  final shuffled = _alphabet.split('');
  shuffled.shuffle();
  return shuffled.join('');
}

String shuffled() {
  if (null != _shuffled) {
    return _shuffled;
  }
  return _shuffled = shuffle();
}
