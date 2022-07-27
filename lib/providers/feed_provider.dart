import 'dart:convert';

import 'package:cookgator/database/database.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class FeedProvider {
  final MyDatabase db;

  FeedProvider() : db = constructDb(logStatements: true) {
    _load();
  }

  Future<void> refresh() async {
    await _load();
  }

  _load() async {
    // await db.clear();
    var sources = await db.getEnabledSources();
    Future.forEach(
      sources,
      (source) async => await _sync(source as FeedSource),
    );
  }

  Future<void> _sync(FeedSource source) async {
    var feedResponse = await http.get(
      Uri.parse(source.feedURl),
    );

    var atomFeed = RssFeed.parse(
        utf8.decode(feedResponse.bodyBytes)); // for parsing Atom feed

    atomFeed.items?.forEach((item) async {
      await _save(item, source);
    });
  }

  Future<void> _save(RssItem item, FeedSource source) async {
    var feedItem = FeedItem(
      id: item.guid.or(""),
      title: item.title.or("Unknown Title"),
      link: item.link.or(""),
      date: item.pubDate!,
      description: item.description.or(""),
      author: item.dc?.creator ?? 'Anonymous',
      publisher: item.dc?.publisher,
      thumbnailUrl: item.media?.thumbnails?.first.url,
      sourceId: source.id,
      isFav: false,
    );

    if ((await db.checkIfExists(feedItem)).isEmpty) {
      db.addFeedItem(feedItem);
    }
  }

  void toggleFavorite(FeedItem item) {
    db.toggleFavorite(item.copyWith(isFav: !item.isFav));
  }

  void toggleSource(FeedSource source) {
    db.toggleSource(source.copyWith(enabled: !source.enabled));
  }
}

extension StringToDefault on String? {
  String or(String other) {
    return this ?? other;
  }
}
