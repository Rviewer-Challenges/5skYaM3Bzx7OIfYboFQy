import 'package:cookgator/models/feed_item.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/ui/feed_item_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(FeedItemAdapter());
  await Hive.openBox<FeedItem>(FeedProvider.boxName);
  // await Hive.box<FeedItem>(FeedProvider.boxName).clear();

  runApp(
    Provider(
      create: (_) => FeedProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<FeedProvider>();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ValueListenableBuilder<Box<FeedItem>>(
        valueListenable: Hive.box<FeedItem>(FeedProvider.boxName).listenable(),
        builder: (context, box, child) {
          var items = box.values.toList();
          items.sort((a, b) => b.date?.compareTo(a.date ?? '') ?? 0);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                var item = items[index];
                return FeedItemView(item: item);
              },
            ),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
