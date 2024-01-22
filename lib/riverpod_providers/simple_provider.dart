import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Simple Provider instance
final nameProvider = Provider<String>(
  (ref) => "Hello World",
);
// family modifier is use add value to any provier later after initialization
final nameProvider2 = Provider.family<String, String>(
  (ref, name) => "Hello $name",
);

/*
// to get provider value using Stateless widget

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // to get provider value using Stateless widget
    // final name = ref.watch(nameProvider);
    return Scaffold(
      body: Center(
        child: Consumer(builder: (_, ref, c) {
          final name = ref.watch(nameProvider);

          return Text(
            name,
          );
        }),
      ),
    );
  }
}
*/

class SimpleProviderExample extends ConsumerStatefulWidget {
  const SimpleProviderExample({super.key});

  @override
  ConsumerState<SimpleProviderExample> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<SimpleProviderExample> {
  @override
  Widget build(BuildContext context) {
    final name = ref.watch(nameProvider);
    final name2 = ref.watch(nameProvider2("Furqan"));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod (Simple Provider)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              name2,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
