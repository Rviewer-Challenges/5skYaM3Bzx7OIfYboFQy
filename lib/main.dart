import 'package:cookgator/pages/list_page.dart';
import 'package:cookgator/providers/feed_provider.dart';
import 'package:cookgator/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (_) => FeedProvider(),
        ),
        ChangeNotifierProvider(create: (_) => ThemeProvider())
      ],
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

    return Consumer<ThemeProvider>(
      builder: (_, ThemeProvider provider, __) {
        return MaterialApp(
          title: 'Food Aggregator',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          darkTheme: ThemeData.dark(),
          themeMode: provider.current,
          home: const ListPage(title: 'Food Aggregator'),
        );
      },
    );
  }
}
