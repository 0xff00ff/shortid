import 'package:shortid/shortid.dart';
import 'package:test/test.dart';

void main() {
  setUp(() async {
    shortid.seed(1.0);
    shortid.characters(null);
  });
  test('should run a bunch and never get duplicates', () {
    shortid.seed(1.0);
    final ids = <String, int>{};
    String id;

    const i = 1000000;
    for (var q = 0; q < i; q++) {
      id = shortid.generate();
      expect(id.length, lessThan(17));
      final incid = ids[id];
      if (incid != null) {
        ids[id] = incid + 1;
      } else {
        ids[id] = 1;
      }
      expect(ids[id], equals(1));
    }

    expect(ids.keys.length, equals(i));
  });
}
