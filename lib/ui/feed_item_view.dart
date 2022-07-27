import 'package:cookgator/database/database.dart';
import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/ui/fav_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedItemView extends StatelessWidget {
  final FeedItemWithSource item;
  final Function(FeedItemWithSource) onTap;

  const FeedItemView({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(item);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(item.heading),
              subtitle: Text(item.subheading),
              trailing: InkWell(
                onTap: () {
                  var provider = context.read<FeedProvider>();
                  provider.toggleFavorite(item.item);
                },
                child: FavIcon(isFav: item.item.isFav),
              ),
            ),
            SizedBox(
              height: 200.0,
              child: Ink.image(
                image: item.cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                item.supportingText,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
