import 'package:cookgator/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class SettingsPage extends HookWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ThemeProvider>();
    var nigthMode = useState(provider.current == ThemeMode.dark);

    return Row(
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
    );
  }
}
