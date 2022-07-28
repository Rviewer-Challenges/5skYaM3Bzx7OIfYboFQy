import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:cookgator/ui/fav_icon.dart';
import 'package:flutter/material.dart';

class FeedItemView extends StatelessWidget {
  final FeedItemWithSource item;
  final Function(FeedItemWithSource) onLiked;
  final Function(FeedItemWithSource) onTap;

  const FeedItemView({
    Key? key,
    required this.item,
    required this.onTap,
    required this.onLiked,
  }) : super(key: key);

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
                  onLiked(item);
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
