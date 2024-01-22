import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/riverpod_providers/state_notifier_providerd.dart/counter_provider.dart';

//StateNotifier Provider instance
final counterProvider = StateNotifierProvider<Counter, int>(
  (ref) => Counter(),
);

// to get provider value using Stateless widget
class StateNotifierProviderExample extends ConsumerWidget {
  const StateNotifierProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // to get provider value using Stateless widget
    print("rebuild ");
    final counter = ref.watch(counterProvider);
    print("rebuild with $counter");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod (State Provider)"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(counterProvider.notifier).reset();
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
              ref.read(counterProvider.notifier).decrement();
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {
              ref.read(counterProvider.notifier).increment();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
