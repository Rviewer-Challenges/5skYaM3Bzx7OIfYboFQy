import 'package:cookgator/database/database.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/ui/fav_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends HookWidget {
  final FeedItem item;

  const DetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var timeAgo = timeago.format(item.date);
    var heading = item.title;
    var subheading = "By ${item.author} - ${item.publisher}";
    var cardImage = NetworkImage("https://corsproxy.io/?${item.thumbnailUrl}");
    var supportingText = "Published $timeAgo on ${item.source}";

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        title: Container(
          color: Colors.black.withAlpha(100),
          child: ListTile(
            title: Text(
              heading,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              subheading,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: cardImage, fit: BoxFit.cover),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Text(item.description),
            ),
          ),
          ElevatedButton(
            onPressed: _launchUrl,
            child: const Text("Read more ..."),
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

  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(item.link))) {
      throw 'Could not launch ${item.link}';
    }
  }
}
