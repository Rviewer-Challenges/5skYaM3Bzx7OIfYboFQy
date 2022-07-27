import 'package:cookgator/database/database.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ThemeProvider>();
    var feedProvider = context.read<FeedProvider>();
    var nigthMode = useState(provider.current == ThemeMode.dark);
    var sources = useStream(feedProvider.db.getSources());

    return Column(
      children: [
        ..._sources(sources, feedProvider, context),
        Text(
          "Settings",
          style: Theme.of(context).textTheme.headline6,
        ),
        Row(
          children: [
            const SizedBox(width: 16.0),
            const Text("Use Night Mode"),
            Switch(
              value: nigthMode.value,
              onChanged: (newValue) {
                nigthMode.value = newValue;
                var newMode = newValue ? ThemeMode.dark : ThemeMode.light;
                provider.setThemeMode(newMode);
              },
            )
          ],
        ),
      ],
    );
  }

  List<Widget> _sources(
    AsyncSnapshot<List<FeedSource>> sources,
    FeedProvider feedProvider,
    BuildContext context,
  ) {
    if (!sources.hasData) {
      return [
        const Center(
          child: CircularProgressIndicator(),
        ),
      ];
    }
    return [
      Text(
        "Sources",
        style: Theme.of(context).textTheme.headline6,
      ),
      for (var source in sources.data!)
        Row(
          children: [
            const SizedBox(width: 16.0),
            Text(source.name),
            Switch(
              value: source.enabled,
              onChanged: (newValue) {
                feedProvider.toggleSource(source);
              },
            )
          ],
        ),
      const Divider(),
    ];
  }
}
