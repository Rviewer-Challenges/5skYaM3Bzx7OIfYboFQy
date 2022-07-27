// These imports are only needed to open the database
import 'dart:io';

import 'package:cookgator/database/feed_items.dart';
import 'package:cookgator/database/feed_source.dart';
import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(tables: [FeedItems, FeedSources])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      beforeOpen: (details) async {
        if (details.wasCreated) {
          var sources = {
            "Recipes at bonappetit.com":
                "https://www.bonappetit.com/feed/recipes-rss-feed/rss",
            "Cooking at bonappetit.com":
                "https://www.bonappetit.com/feed/cooking-rss-feed/rss",
          };

          for (final mapEntry in sources.entries) {
            final key = mapEntry.key;
            final value = mapEntry.value;

            var source = FeedSourcesCompanion.insert(
              name: key,
              feedURl: value,
              enabled: const Value(true),
            );
            await into(feedSources).insert(source);
          }
        }
      },
    );
  }

  Future<int> addFeedItem(FeedItem feedItem) {
    return into(feedItems).insert(feedItem);
  }

  Future<List<FeedItem>> checkIfExists(FeedItem feedItem) {
    return (select(feedItems)..where((tbl) => tbl.id.equals(feedItem.id)))
        .get();
  }

  Future toggleFavorite(FeedItem feedItem) {
    return update(feedItems).replace(feedItem);
  }

  Future toggleSource(FeedSource feedSource) {
    return update(feedSources).replace(feedSource);
  }

  Future clear() {
    return delete(feedItems).go();
  }

  Future<List<FeedItemWithSource>> newestFeedItems(bool onlyFavorite) async {
    var query = select(feedItems);
    if (onlyFavorite) {
      query = query..where((tbl) => tbl.isFav.equalsExp(const Constant(true)));
    }
    query.orderBy([
      (t) => OrderingTerm(
            expression: t.date,
            mode: OrderingMode.desc,
          )
    ]);
    var join = query.join([
      leftOuterJoin(feedSources, feedSources.id.equalsExp(feedItems.sourceId))
    ])
      ..where(feedSources.enabled.equals(true));

    var typedResultList = await join.get();
    return typedResultList.map((row) {
      return FeedItemWithSource(
        row.readTable(feedItems),
        row.readTable(feedSources),
      );
    }).toList();
  }

  Stream<List<FeedSource>> getSources() {
    return select(feedSources).watch();
  }

  Future<List<FeedSource>> getEnabledSources() {
    return (select(feedSources)
          ..where((tbl) => tbl.enabled.equalsExp(const Constant(true))))
        .get();
  }

  Stream<FeedItem> watchFeedItem(FeedItemWithSource item) {
    return (select(feedItems)..where((tbl) => tbl.id.equals(item.item.id)))
        .watchSingle();
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
