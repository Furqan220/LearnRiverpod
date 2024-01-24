import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/global.dart';
import 'package:testapp/home_navigation_example/navigation_view.dart';
import 'package:testapp/main.dart';
import 'package:testapp/riverpod_code_generator/riverpod_generator_index.dart';
import 'package:testapp/riverpod_providers/type_of_providers.dart';
import 'package:testapp/search_filter/players_view.dart';


class IndexView extends ConsumerWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // final isLightTheme = ref.watch(lightTheme);
    return   Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("Learn Riverpod"),
        // actions: [
        //   IconButton(onPressed: (){
        //     // ref.read(lightTheme.notifier).update((state) => !isLightTheme);
        //   }, icon: Icon(
        //     isLightTheme ? Icons.dark_mode : Icons.light_mode
        //   ))
        // ],
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
                 const SizedBox(
                  height: 20,
                ),
                   ElevatedButton(
              onPressed: () =>
                  G.goto(context, const RiverpodGeneratorIndexView()),
              child: const Text("Riverpod Code Generator \n(Simple Provider)",textAlign: TextAlign.center,),
            ),
                 const SizedBox(
                  height: 20,
                ),
                   ElevatedButton(
              onPressed: () =>
                  G.goto(context, const PlayersView()),
              child: const Text("Search Filter",textAlign: TextAlign.center,),
            ),
                 const SizedBox(
                  height: 20,
                ),
                   ElevatedButton(
              onPressed: () =>
                  G.goto(context, const MainHomeView()),
              child: const Text("Home Navigation (Example)",textAlign: TextAlign.center,),
            ),
        
          ],
        ),
      ),
    );
  }
}

