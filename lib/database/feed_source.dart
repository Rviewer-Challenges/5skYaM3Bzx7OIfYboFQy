import 'package:drift/drift.dart';

@DataClassName("FeedSource")
class FeedSources extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  TextColumn get feedURl => text()();
  BoolColumn get enabled => boolean().withDefault(const Constant(true))();
}
