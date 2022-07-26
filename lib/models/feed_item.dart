import 'package:hive/hive.dart';

part 'feed_item.g.dart';

@HiveType(typeId: 0)
class FeedItem extends HiveObject {
  @HiveField(0)
  late String id;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late String link;

  @HiveField(3)
  String? date;

  @HiveField(4)
  late String description;

  @HiveField(5)
  late String author;

  @HiveField(6)
  String? publisher;

  @HiveField(7)
  String? thumbnailUrl;

  @HiveField(8)
  late String source;

  @HiveField(9)
  bool isFav = false;
}
