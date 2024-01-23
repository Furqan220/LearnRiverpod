import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/riverpod_providers/future_provider_example.dart/user_model.dart';

//Simple Provider instance
final nameProvider = Provider<String>(
  (ref) => "Hello World",
);
// family modifier is use add only single value to any provier later after initialization
final nameProvider2 = Provider.family<String, String>(
  (ref, name) => "Hello $name",
);

// family modifier is use add object with multiple values to any provier later after initialization
final userProvider = Provider.family<String, UserModel>(
  (ref, user) => "Hello ${user.firstName} ${user.lastName}",
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
    final user = ref.watch(userProvider( const UserModel(map:  {
      "first_name": "Furqan",
      "last_name": "Ahmed",
    })));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod (Simple Provider)"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const Text(
              "Simple Provider",
              style:  TextStyle(fontSize: 20),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 30),
            ),
            const Text(
              "Simple Provider with family modifier for single value",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              name2,
              style: const TextStyle(fontSize: 30),
            ),
            const Text(
              "Simple Provider with family modifier for object including multiple values",
              style:  TextStyle(fontSize: 20),
            ),
            Text(
              user,
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
