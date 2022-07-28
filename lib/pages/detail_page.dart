import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/ui/fav_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends HookWidget {
  final FeedItemWithSource data;

  const DetailPage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.read<FeedProvider>();

    var itemChanges = useStream(provider.db.watchFeedItem(data));

    return Scaffold(
      appBar: AppBar(
        title: Text(data.subheading),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(data.heading),
            trailing: InkWell(
              onTap: () {
                var provider = context.read<FeedProvider>();
                provider.toggleFavorite(itemChanges.data ?? data.item);
              },
              child: FavIcon(isFav: itemChanges.data?.isFav ?? data.item.isFav),
            ),
          ),
          SizedBox(
            height: 200.0,
            child: Ink.image(
              image: data.cardImage,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(data.item.description),
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
              data.supportingText,
              style: Theme.of(context).textTheme.caption,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(data.item.link))) {
      throw 'Could not launch ${data.item.link}';
    }
  }
}
