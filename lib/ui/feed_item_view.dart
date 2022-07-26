import 'package:cookgator/database/database.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/ui/fav_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class FeedItemView extends StatelessWidget {
  final FeedItem item;

  const FeedItemView({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return item.thumbnailUrl == null ? _singleLine() : _withImage(context);
  }

  Widget _singleLine() {
    return ListTile(
      title: Text(item.title),
    );
  }

  Card _withImage(BuildContext context) {
    var timeAgo = timeago.format(item.date);

    var heading = item.title;
    var subheading = "By ${item.author} - ${item.publisher}";
    var cardImage = NetworkImage("https://corsproxy.io/?${item.thumbnailUrl}");
    var supportingText = "Published $timeAgo on ${item.source}";

    return Card(
      elevation: 4.0,
      child: Column(
        children: [
          ListTile(
            title: Text(heading),
            subtitle: Text(subheading),
            trailing: InkWell(
              onTap: () {
                var provider = context.read<FeedProvider>();
                provider.toggleFavorite(item);
              },
              child: FavIcon(isFav: item.isFav),
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Ink.image(
              image: cardImage,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.centerLeft,
            child: Text(
              supportingText,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }
}
