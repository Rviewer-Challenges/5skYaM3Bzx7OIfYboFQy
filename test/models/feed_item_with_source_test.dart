import 'package:cookgator/database/database.dart';
import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:test/test.dart';

void main() {
  group('FeedItemWithSource', () {
    var item = FeedItem(
      title: "My Item",
      isFav: false,
      sourceId: 1,
      id: "guid",
      date: DateTime.now(),
      link: "https://example.com/1",
      author: "Author",
      description: "Description",
    );
    var source = FeedSource(
      id: 1,
      name: "Recipes",
      feedURl: "https://example.com/feed",
      enabled: true,
    );

    test('FeedItemWithSource calculate time ago', () {
      final counter = FeedItemWithSource(item, source);

      expect(counter.timeAgo, "a moment ago");
    });

    test('FeedItemWithSource heading is the title', () {
      final counter = FeedItemWithSource(item, source);

      expect(counter.heading, item.title);
    });

    test('FeedItemWithSource subheading to include author and publisher', () {
      final counter = FeedItemWithSource(item, source);

      expect(counter.subheading, "By ${item.author} - ${item.publisher}");
    });

    test(
        'FeedItemWithSource supportingText to include time ago and source name',
        () {
      final counter = FeedItemWithSource(item, source);

      expect(
          counter.supportingText, "Published a moment ago on ${source.name}");
    });
  });
}
