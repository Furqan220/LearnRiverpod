import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'riverpod_generator_example.g.dart';

/*
 Riverpod Code Generator 
  Step # 1
  add required dependencies
  flutter_riverpod: ^2.4.9
  riverpod_annotation: ^2.3.3

  dev: 
  riverpod_generator: ^2.3.9
  build_runner: ^2.4.8
  
  Step # 2
   - create functions which value whom provider you want
  
  Step # 3
   - run command in root terminal
   $ dart run build_runner watch
  
  Step # 4
   - write file name on top to create provider file like as below:
   part 'riverpod_generator_example.g.dart';
   - press Ctrl + S 
 */

  // Step # 1
  // - create functions which value whom provider you want 
  // to get autodispose provider with state preservation
@Riverpod(keepAlive: true)
String name(NameRef ref) => "furqan";

// to get simple autodispose provider
// @riverpod
// String name(NameRef ref) => "furqan";

class RiverpodGeneratorExample extends ConsumerWidget {
  const RiverpodGeneratorExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);
    return Scaffold(
      body: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
