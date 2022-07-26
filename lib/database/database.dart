// These imports are only needed to open the database

import 'package:cookgator/database/feed_items.dart';
import 'package:cookgator/database/feed_source.dart';
import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:drift/drift.dart';

export 'database/shared.dart';

part 'database.g.dart';

@DriftDatabase(tables: [FeedItems, FeedSources])
class MyDatabase extends _$MyDatabase {
  MyDatabase(QueryExecutor e) : super(e);

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

  Stream<List<FeedItemWithSource>> newestFeedItems(bool onlyFavorite) {
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

    return join.watch().map((rows) {
      return rows.map((row) {
        return FeedItemWithSource(
          row.readTable(feedItems),
          row.readTable(feedSources),
        );
      }).toList();
    });
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
