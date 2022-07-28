import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:cookgator/ui/fav_icon.dart';

void main() {
  testWidgets('FavIcon has an icon', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FavIcon(isFav: false),
      ),
    );
    final icon = find.byType(Icon);

    expect(icon, findsOneWidget);
  });

  testWidgets('FavIcon has empty hearth is not favorite', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FavIcon(isFav: false),
      ),
    );
    final icon = find.byType(Icon);

    expect(
      tester.widget(icon),
      isA<Icon>().having((w) => w.icon, "icon", Icons.favorite_outline),
    );
  });

  testWidgets('FavIcon has full hearth is favorite', (tester) async {
    await tester.pumpWidget(
      const Directionality(
        textDirection: TextDirection.ltr,
        child: FavIcon(isFav: true),
      ),
    );
    final icon = find.byType(Icon);

    expect(
      tester.widget(icon),
      isA<Icon>().having((w) => w.icon, "icon", Icons.favorite_outlined),
    );
  });
}
