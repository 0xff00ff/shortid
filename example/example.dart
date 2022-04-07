import 'package:shortid/shortid.dart';

void main () {
  final id = shortid.generate();
  print(id);
}