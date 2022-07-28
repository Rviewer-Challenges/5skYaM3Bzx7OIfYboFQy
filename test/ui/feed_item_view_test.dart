import 'package:cookgator/database/database.dart';
import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:cookgator/ui/feed_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:network_image_mock/network_image_mock.dart';

class OnMockFunction extends Mock implements Function {
  void call(FeedItemWithSource task);
}

void main() {
  var item = FeedItem(
    title: "My Item",
    isFav: false,
    sourceId: 1,
    id: "guid",
    date: DateTime.now(),
    link: "https://example.com/1",
    author: "Author",
    description: "Description",
    thumbnailUrl: "https://www.fake.net/image.png",
  );
  var source = FeedSource(
    id: 1,
    name: "Recipes",
    feedURl: "https://example.com/feed",
    enabled: true,
  );
  final itemWithSource = FeedItemWithSource(item, source);
  final onTapMock = OnMockFunction();
  final onLikedMock = OnMockFunction();
  final widget = MaterialApp(
    home: Material(
      child: FeedItemView(
        item: itemWithSource,
        onTap: onTapMock,
        onLiked: onLikedMock,
      ),
    ),
  );

  testWidgets('ItemView has a FavIcon', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(widget);
      var icon = find.byType(Icon);

      expect(icon, findsOneWidget);
    });
  });

  testWidgets('ItemView has a heading', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(widget);
      var icon = find.text(itemWithSource.heading);

      expect(icon, findsOneWidget);
    });
  });

  testWidgets('ItemView has a subheading', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(widget);
      var icon = find.text(itemWithSource.subheading);

      expect(icon, findsOneWidget);
    });
  });

  testWidgets('ItemView has a supporting text', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(widget);
      var icon = find.text(itemWithSource.supportingText);

      expect(icon, findsOneWidget);
    });
  });

  testWidgets('ItemView tap should trigger event', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(widget);
      var view = find.byType(FeedItemView);

      await tester.tap(view);
      await tester.pumpAndSettle();

      verify(onTapMock(itemWithSource)).called(1);
    });
  });

  testWidgets('ItemView tap fav icon should trigger event', (tester) async {
    mockNetworkImagesFor(() async {
      await tester.pumpWidget(widget);
      var view = find.byType(Icon);

      await tester.tap(view);
      await tester.pumpAndSettle();

      verify(onLikedMock(itemWithSource)).called(1);
    });
  });
}
