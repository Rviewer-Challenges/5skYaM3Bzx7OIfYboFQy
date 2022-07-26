import 'package:cookgator/models/feed_item.dart';
import 'package:cookgator/providers/feed_provider.dart';
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
    var dateTime = DateTime.parse(item.date!);
    var timeAgo = timeago.format(dateTime);

    var heading = item.title;
    var subheading = "By ${item.author} - ${item.publisher}";
    var cardImage = NetworkImage("https://corsproxy.io/?${item.thumbnailUrl!}");
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
              child: Icon(
                item.isFav ? Icons.favorite_outlined : Icons.favorite_outline,
              ),
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
            child: Text(supportingText),
          ),
          ButtonBar(
            children: [
              TextButton(
                child: const Text('View'),
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
