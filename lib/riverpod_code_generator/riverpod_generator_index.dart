import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/global.dart';
import 'package:testapp/main.dart';
import 'package:testapp/riverpod_code_generator/notifier_provider_generator/counter_notifier_provider_generator.dart';
import 'package:testapp/riverpod_code_generator/simple_provider/riverpod_generator_example.dart';


class RiverpodGeneratorIndexView extends ConsumerWidget {
  const RiverpodGeneratorIndexView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // final isLightTheme = ref.watch(lightTheme);
    return   Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primary,

        title: const Text("Learn Riverpod"),
        // actions: [
        //   IconButton(onPressed: (){
        //     ref.read(lightTheme.notifier).update((state) => !isLightTheme);
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
              onPressed: () =>
                  G.goto(context, const RiverpodGeneratorExample()),
              child: const Text("Riverpod Code Generator \n(Simple Provider)",textAlign: TextAlign.center,),
            ),
                 const SizedBox(
                  height: 20,
                ),
                   ElevatedButton(
              onPressed: () =>
                  G.goto(context, const RiverpodGeneratorNotifierExample()),
              child: const Text("Riverpod Code Generator \n(Notifier Provider)",textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}

