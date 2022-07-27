import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/ui/fav_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends HookWidget {
  final FeedItemWithSource item;

  const DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<FeedProvider>();

    var itemChanges = useStream(provider.db.watchFeedItem(item));

    return Scaffold(
      appBar: AppBar(
        title: Text(item.subheading),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(item.heading),
            trailing: InkWell(
              onTap: () {
                var provider = context.read<FeedProvider>();
                provider.toggleFavorite(itemChanges.data ?? item.item);
              },
              child: FavIcon(isFav: itemChanges.data?.isFav ?? item.item.isFav),
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Ink.image(
              image: item.cardImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(item.item.description),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: _launchUrl,
              child: const Text("Read more ..."),
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
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(item.item.link))) {
      throw 'Could not launch ${item.item.link}';
    }
  }
}
