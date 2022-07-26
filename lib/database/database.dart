// These imports are only needed to open the database
import 'dart:io';

import 'package:cookgator/database/feed_items.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(tables: [FeedItems])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> addFeedItem(FeedItem feedItem) {
    return into(feedItems).insert(feedItem);
  }

  Future toggleFavorite(FeedItem feedItem) {
    return update(feedItems).replace(feedItem);
  }

  Future clear() {
    return delete(feedItems).go();
  }

  Future<List<FeedItem>> newestFeedItems(bool onlyFavorite) {
    var query = (select(feedItems)
      ..orderBy([
        (t) => OrderingTerm(
              expression: t.date,
              mode: OrderingMode.desc,
            )
      ]));
    if (onlyFavorite) {
      query = query..where((tbl) => tbl.isFav.equalsExp(const Constant(true)));
    }
    return query.get();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(
    () async {
      // put the database file, called db.sqlite here, into the documents folder
      // for your app.
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'db.sqlite'));
      return NativeDatabase(file);
    },
  );
}
