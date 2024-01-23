import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/index.dart';


// Change theme with RiverPod
final lightTheme = StateProvider<bool>((ref) => true);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isLightTheme =ref.watch(lightTheme); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              brightness: isLightTheme ? Brightness.light : Brightness.dark,
            seedColor: Colors.blue),
          useMaterial3: true,
        
          ),
      
      home: const IndexView(),
    );
  }
}
