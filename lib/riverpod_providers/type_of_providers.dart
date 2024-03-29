import 'package:flutter/material.dart';
import 'package:testapp/flutter_filtering_rebuilds/user_view.dart';
import 'package:testapp/global.dart';
import 'package:testapp/riverpod_providers/notifier_provider_example/counter_notifier_view.dart';
import 'package:testapp/riverpod_providers/future_provider_example.dart/users_view.dart';
import 'package:testapp/riverpod_providers/simple_provider.dart';
import 'package:testapp/riverpod_providers/state_notifier_providerd.dart/counter_screen.dart';
import 'package:testapp/riverpod_providers/state_provider.dart';
import 'package:testapp/riverpod_providers/stream_provider.dart';

class ProviderIndexView extends StatelessWidget {
  const ProviderIndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Types of Provider"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => G.goto(context, const SimpleProviderExample()),
                child: const Text("Provider \n(with family modifier)",textAlign: TextAlign.center,)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => G.goto(context, const StateProviderExample()),
                child: const Text("State Provider \n(with auto dispose and keep modifier)",textAlign: TextAlign.center,)),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () =>
                    G.goto(context, const StateNotifierProviderExample()),
                child: const Text("State Notifier Provider")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => G.goto(context, const FutureProviderExample()),
                child: const Text("Future Provider")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => G.goto(context, const StreamProviderExample()),
                child: const Text("Stream Provider")),
            const SizedBox(
              height: 20,
            ),
         
            ElevatedButton(
                onPressed: () => G.goto(context, const UserViewSelectModifier()),
            child: const Text("State Notifier Provider with Select Modifier"),),

            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () =>
                    G.goto(context, const NotifierProviderExample()),
                child: const Text("Notifier Provider Example")),
          ],
        ),
      ),
    );
  }
}
