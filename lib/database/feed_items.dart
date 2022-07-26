import 'package:drift/drift.dart';

@DataClassName("FeedItem")
class FeedItems extends Table {
  TextColumn get id => text().unique()();
  TextColumn get title => text()();
  TextColumn get link => text()();
  DateTimeColumn get date => dateTime()();
  TextColumn get description => text()();
  TextColumn get author => text()();
  TextColumn get publisher => text().nullable()();
  TextColumn get thumbnailUrl => text().nullable()();
  TextColumn get source => text()();
  BoolColumn get isFav => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id};
}
