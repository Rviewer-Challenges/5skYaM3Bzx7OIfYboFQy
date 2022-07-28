import 'package:cookgator/database/database.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedItemWithSource {
  final FeedItem item;
  final FeedSource source;

  FeedItemWithSource(this.item, this.source);

  String get timeAgo => timeago.format(item.date);
  String get heading => item.title;
  String get subheading => "By ${item.author} - ${item.publisher}";
  NetworkImage get cardImage =>
      NetworkImage("https://corsproxy.io/?${item.thumbnailUrl}");
  String get supportingText => "Published $timeAgo on ${source.name}";
}
