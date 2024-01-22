import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/index.dart';
import 'package:testapp/riverpod_providers/future_provider_example.dart/users_view.dart';
import 'package:testapp/riverpod_providers/simple_provider.dart';
import 'package:testapp/riverpod_providers/state_notifier_providerd.dart/counter_screen.dart';
import 'package:testapp/riverpod_providers/state_provider.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true),
      
      home: const IndexView(),
    );
  }
}
