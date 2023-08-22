import 'package:hive_flutter/hive_flutter.dart';

import '../injection_container.dart' as service_locator;

class InitializeApp {
  InitializeApp._();

  static Future<void> init() async {
    // Initialize service locator
    await service_locator.initLocator();

    // Initializing hive
    await Hive.initFlutter();
    
    // Register hive adapter

  }
}