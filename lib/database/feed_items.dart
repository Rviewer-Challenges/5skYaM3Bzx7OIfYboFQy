import 'package:cookgator/database/database.dart';
import 'package:cookgator/database/feed_source.dart';
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
  BoolColumn get isFav => boolean().withDefault(const Constant(false))();
  IntColumn get sourceId =>
      integer().named("source_id").references(FeedSources, #id)();

  @override
  Set<Column> get primaryKey => {id};
}
