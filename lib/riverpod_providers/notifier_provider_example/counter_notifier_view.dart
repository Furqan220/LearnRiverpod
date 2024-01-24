import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/riverpod_providers/notifier_provider_example/counter_notifier.dart';


// there are some limitations such as auto generate by riverpod generator in state notifier provider which will over come by riverpod introducing update version Notifier & Notifier Provider
// to get provider value using Stateless widget
class NotifierProviderExample extends ConsumerWidget {
  const NotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // to get provider value using Stateless widget
    print("rebuild ");
    final counter = ref.watch(counterNotifierProvider);
    print("rebuild with $counter");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod (State Provider)"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).reset();
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Center(
        child: Text(
          counter.toString(),
          style: const TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).decrement();
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {
              ref.read(counterNotifierProvider.notifier).increment();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
