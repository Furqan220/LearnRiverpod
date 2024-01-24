import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/search_filter/players_notifier_povider.dart';

class PlayersView extends ConsumerWidget {
  const PlayersView({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final players = ref.watch(playersNotifierProvider);
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Search Functionality",
          style: Theme.of(context).textTheme.titleMedium,
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(
            width: double.infinity,
            height: 80,
            child: TextField(
              onChanged: (value) => ref.read(playersNotifierProvider.notifier).filterPlayer(value),
            ),
          ),
          Expanded(child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
            itemBuilder: (_,i) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
          players[i]["name"],
          style: Theme.of(context).textTheme.headlineMedium,
          ),
                Text(
          players[i]["country"],
          style: Theme.of(context).textTheme.bodyMedium,
          ),
              ],
            ), 
            separatorBuilder: (_,i) => const SizedBox(height: 20,), 
            itemCount: players.length))
        ],
      ),
    );
  }
}