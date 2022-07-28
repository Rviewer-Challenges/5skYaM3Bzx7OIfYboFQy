import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:cookgator/ui/fav_icon.dart';
import 'package:flutter/material.dart';

class FeedItemView extends StatelessWidget {
  final FeedItemWithSource data;
  final Function(FeedItemWithSource) onLiked;
  final Function(FeedItemWithSource) onTap;

  const FeedItemView({
    Key? key,
    required this.data,
    required this.onTap,
    required this.onLiked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(data);
      },
      child: Card(
        elevation: 4.0,
        child: Column(
          children: [
            ListTile(
              title: Text(data.heading),
              subtitle: Text(data.subheading),
              trailing: InkWell(
                onTap: () {
                  onLiked(data);
                },
                child: FavIcon(isFav: data.item.isFav),
              ),
            ),
            SizedBox(
              height: 200.0,
              child: Ink.image(
                image: data.cardImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                data.supportingText,
                style: Theme.of(context).textTheme.caption,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
