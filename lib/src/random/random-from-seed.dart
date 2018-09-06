double _seed = 1.0;

/// return a random number based on a seed
/// @param seed
/// @returns {number}
double nextValue() {
  _seed = (_seed * 9301 + 49297) % 233280;
  return _seed / (233280.0);
}

void seed(double seed) {
  _seed = seed;
}
