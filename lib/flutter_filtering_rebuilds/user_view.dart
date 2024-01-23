import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/flutter_filtering_rebuilds/user.dart';
import 'package:testapp/flutter_filtering_rebuilds/user_notifier.dart';

//StateNotifier Provider instance
final userProvider = StateNotifierProvider<UserNotifier, User>(
  (ref) => UserNotifier(const User(name: "Furqan" ,address: "Pakistan")),
);

// to get provider value using Stateless widget
class UserViewSelectModifier extends ConsumerWidget {
  const UserViewSelectModifier({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // to get provider value using Stateless widget
    print("rebuild ");
    // this select method only rebuilds when name value changed
    final user = ref.watch(userProvider.select((value) => value.name));

    // this is one is use to watch any change in user state 
    // final user = ref.watch(userProvider);

    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod (State Provider)"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              user,
              // "${user.name} ${user.address}",
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onSubmitted: (v)=> ref.read(userProvider.notifier).updateName(v),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onSubmitted: (v)=> ref.read(userProvider.notifier).updateAddress(v),
            ),
          ],
        ),

        
      ),
    
    );
  }
}
