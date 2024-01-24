import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:testapp/index.dart';
import 'package:testapp/persistent_theme_change/theme.dart';
import 'package:testapp/persistent_theme_change/theme_notifier.dart';


// Change theme with RiverPod
// final lightTheme = StateProvider<bool>((ref) => true);

void main() async{
  await GetStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // final isLightTheme =ref.watch(lightTheme); 
    final theme =ref.watch(themeNotifierProvider); 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.lightTheme,
      themeMode: theme,
      // theme: ThemeData(
        
      //     colorScheme: ColorScheme.fromSeed(
      //         brightness: isLightTheme ? Brightness.light : Brightness.dark,
      //       seedColor: Colors.blue),
      //     useMaterial3: true,
        
      //     ),
      
      home: const IndexView(),
    );
  }
}
