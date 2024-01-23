import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/flutter_filtering_rebuilds/user_view.dart';
import 'package:testapp/global.dart';
import 'package:testapp/main.dart';
import 'package:testapp/type_of_providers.dart';


class IndexView extends ConsumerWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isLightTheme = ref.watch(lightTheme);
    return   Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("Learn Riverpod"),
        actions: [
          IconButton(onPressed: (){
            ref.read(lightTheme.notifier).update((state) => !isLightTheme);
          }, icon: Icon(
            isLightTheme ? Icons.dark_mode : Icons.light_mode
          ))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => G.goto(context, const ProviderIndexView()),
            child: const Text("Types of Provider"),),
            ElevatedButton(
                onPressed: () => G.goto(context, const UserViewSelectModifier()),
            child: const Text("State Notifier Provider with Select Modifier"),),
          ],
        ),
      ),
    );
  }
}

