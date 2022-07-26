import 'dart:convert';

import 'package:cookgator/database/database.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class FeedProvider {
  static const feedsUrl = {
    "Recipes at bonappetit.com":
        "https://www.bonappetit.com/feed/recipes-rss-feed/rss",
    "Cooking at bonappetit.com":
        "https://www.bonappetit.com/feed/cooking-rss-feed/rss",
  };
  static const boxName = "feed_items";

  final MyDatabase db;

  FeedProvider() : db = MyDatabase() {
    _load();
  }

  _load() async {
    // await db.clear();
    feedsUrl.forEach((key, value) async => await _sync(key, value));
  }

  Future<void> _sync(String source, String url) async {
    var feedResponse = await http.get(
      Uri.parse(url),
    );

    var atomFeed = RssFeed.parse(
        utf8.decode(feedResponse.bodyBytes)); // for parsing Atom feed

    atomFeed.items?.forEach((item) {
      _save(item, source);
    });
  }

  void _save(RssItem item, String source) {
    var feedItem = FeedItem(
      id: item.guid.or(""),
      title: item.title.or("Unknown Title"),
      link: item.link.or(""),
      date: item.pubDate!,
      description: item.description.or(""),
      author: item.dc?.creator ?? 'Anonymous',
      publisher: item.dc?.publisher,
      thumbnailUrl: item.media?.thumbnails?.first.url,
      source: source,
      isFav: false,
    );

    db.addFeedItem(feedItem);
  }

  void toggleFavorite(FeedItem item) {
    db.toggleFavorite(item.copyWith(isFav: !item.isFav));
  }
}

extension StringToDefault on String? {
  String or(String other) {
    return this ?? other;
  }
}
