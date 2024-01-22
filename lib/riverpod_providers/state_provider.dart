import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//State Provider instance
final countProvider = StateProvider.autoDispose<int>(
  
  (ref) {
    // ref.keepAlive();
    return 0 ;
  },
);

// to get provider value using Stateless widget
class StateProviderExample extends ConsumerWidget {
  const StateProviderExample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    // to get provider value using Stateless widget
    final count = ref.watch(countProvider);

    //to listen value changes of counter provider
    ref.listen(countProvider, (previous, next) { 
      if (next == 5) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("The Number can't be exceeded from 5"),),
        );
      }


    });

 print("rebuild");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("Riverpod (State Provider)"),
        actions: [
           IconButton(
         
        onPressed: (){
          //to reset the countstateprovider value
          // ref.invalidate(countProvider);
          ref.refresh(countProvider);
        }, 
        icon: const Icon(Icons.refresh),
        
        ),
        ],
      ),
      body: Center(
        child:  Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 50
            ),
          ),
      ),

      floatingActionButton: IconButton(
        
        style: IconButton.styleFrom(
   
   
   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
   
        ),
        onPressed: (){
          //to update the countstateprovider value
          ref.read(countProvider.notifier).state++;

          ref.read(countProvider.notifier).update((state) => state++);
        }, 
        icon: const Icon(Icons.add),
        
        ),
    );
  }
}

