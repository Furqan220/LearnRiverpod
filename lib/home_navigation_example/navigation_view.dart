import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/home_navigation_example/account_view.dart';
import 'package:testapp/home_navigation_example/blog_view.dart';
import 'package:testapp/home_navigation_example/home_view.dart';
import 'package:testapp/home_navigation_example/navigation_notifier/navigation_notifier.dart';

class MainHomeView extends ConsumerWidget {
  const MainHomeView({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationNotifierProvider);
    return Scaffold(
      body: const [
        HomeView(),
        BlogView(),
        AccountView(),
      ][currentIndex as int],
      bottomNavigationBar: NavigationBar(
          indicatorColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.8),
          onDestinationSelected: (i) =>
              ref.read(navigationNotifierProvider.notifier).setNavigation(i),
          selectedIndex: currentIndex,
          destinations: const [
            NavigationDestination(
                selectedIcon: Icon(Icons.home_outlined),
                icon: Icon(Icons.home),
                label: "Home"),
            NavigationDestination(
                selectedIcon: Icon(Icons.newspaper_outlined),
                icon: Icon(Icons.newspaper),
                label: "Blog"),
            NavigationDestination(
                selectedIcon: Icon(Icons.person_outlined),
                icon: Icon(Icons.person),
                label: "Person"),
          ]),
    );
  }
}
