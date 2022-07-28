import 'package:cookgator/models/feed_item_with_source.dart';
import 'package:cookgator/pages/detail_page.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/pages/settings_page.dart';
import 'package:cookgator/ui/fav_icon.dart';
import 'package:cookgator/ui/feed_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class ListPage extends HookWidget {
  const ListPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<FeedProvider>();
    var onlyFavorite = useState(false);
    var entriesFuture = useMemoized(
        () => provider.db.newestFeedItems(onlyFavorite.value),
        [onlyFavorite.value]);
    var entries = useStream(entriesFuture);
    useOnAppLifecycleStateChange((previous, current) {
      if (current == AppLifecycleState.resumed) {
        provider.refresh();
      }
    });

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: [
            IconButton(
              icon: FavIcon(isFav: onlyFavorite.value),
              tooltip: 'Show only favorites',
              onPressed: () {
                onlyFavorite.value = !onlyFavorite.value;
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Show only favorites',
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return const SettingsPage();
                  },
                );
              },
            ),
          ],
        ),
        body: entries.hasData
            ? _list(entries.data!, provider)
            : const Center(child: CircularProgressIndicator()));
  }

  Widget _list(List<FeedItemWithSource> entries, FeedProvider provider) {
    return RefreshIndicator(
      onRefresh: () {
        return provider.refresh();
      },
      child: ListView.builder(
        itemCount: entries.length,
        itemBuilder: (context, index) {
          var item = entries[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FeedItemView(
              data: item,
              onLiked: (item) {
                var provider = context.read<FeedProvider>();
                provider.toggleFavorite(item.item);
              },
              onTap: (item) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DetailPage(
                      data: item,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
