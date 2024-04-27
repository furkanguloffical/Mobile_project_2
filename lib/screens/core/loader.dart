import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';

class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
    final storage = Storage();
    final isFirstLaunch = await storage.isFirstLaunch();

    if (isFirstLaunch) {
      const darkMode = ThemeMode.system == ThemeMode.dark;

      await storage.setConfig(
          language: getDeviceLanguage(), darkMode: darkMode);

      GoRouter.of(context).replace("/boarding");
    } else {
      final config = await storage.getConfig();
      if (config["language"] == null) {
        storage.setConfig(language: getDeviceLanguage());
      }
      if (config["darkMode"] == null) {
        const darkMode = ThemeMode.system == ThemeMode.dark;
        await storage.setConfig(darkMode: darkMode);
      }
      GoRouter.of(context).replace("/home");
    }
  }

  getDeviceLanguage() {
    final String defaultLocale = Platform.localeName;

    final langParts = defaultLocale.split("_");

    final supportedLanguages = ["en", "tr", "de", "uzb"];

    final String finalLang;
    if (supportedLanguages.contains(langParts[0])) {
      finalLang = langParts[0];
    } else {
      finalLang = "en";
    }
    return finalLang;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
      )),
    );
  }
}
