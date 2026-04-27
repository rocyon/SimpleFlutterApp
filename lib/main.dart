import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

import 'screens/welcome.dart';

late final ValueNotifier<bool> isDarkMode;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initLocalStorage();

  isDarkMode = ValueNotifier(bool.parse(localStorage.getItem("isDarkMode") ?? "false"));
  isDarkMode.addListener(() {
    localStorage.setItem("isDarkMode", isDarkMode.value.toString());
  });

  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _App();
}

class _App extends State<App> {
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isDarkMode,
      builder: (context, value, child) {
        return MaterialApp(
          title: 'Welcome',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
              brightness: Brightness.dark,
            ),
          ),
          themeMode: value ? ThemeMode.dark : ThemeMode.light,
          home: WelcomePage(toggleTheme: toggleTheme),
        );
      },
    );
  }
}