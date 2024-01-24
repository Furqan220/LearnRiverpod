import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/riverpod_code_generator/notifier_provider_generator/notifier_generator_example.dart';
import 'package:testapp/riverpod_providers/notifier_provider_example/counter_notifier.dart';


// to get provider value using Stateless widget
class RiverpodGeneratorNotifierExample extends ConsumerWidget {
  const RiverpodGeneratorNotifierExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // to get provider value using Stateless widget
    print("rebuild ");
    final counter = ref.watch(counterNotifierGeneratorProvider);
    print("rebuild with $counter");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod (State Provider)"),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(counterNotifierGeneratorProvider.notifier).reset();
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
              ref.read(counterNotifierGeneratorProvider.notifier).decrement();
            },
            icon: const Icon(Icons.remove),
          ),
          IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            onPressed: () {
              ref.read(counterNotifierGeneratorProvider.notifier).increment();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
