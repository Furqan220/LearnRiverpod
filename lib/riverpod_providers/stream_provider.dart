import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Stream Provider
// in this example we are using autodispose modifier which dispose the state its no longer watching or needed
//with this modifier we can use keepalive method to preserve the state and dispose whenever we want
final streamProvider = StreamProvider.autoDispose<int>(
  (ref) {

    final link =  ref.keepAlive();
    
    ref.onDispose(() { 
      print("dispose");
      // link.close();
    });

    return Stream.periodic(
    const Duration(seconds: 1),
    (computationCount) {
      if (computationCount == 10) {
        link.close();
      }
      return computationCount;
    },
    
  );
  }
);

class StreamProviderExample extends ConsumerStatefulWidget {
  const StreamProviderExample({super.key});

  @override
  ConsumerState<StreamProviderExample> createState() =>
      _StreamProviderExampleState();
}

class _StreamProviderExampleState extends ConsumerState<StreamProviderExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // streamProvider = StreamProvider<int>((ref) => Stream.periodic(const Duration(seconds: 1),
    // (computationCount) => computationCount,
    // ),);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    // streamProvider= null;
  }

  @override
  Widget build(BuildContext context) {
    // to get future provider instance using Stateless widget
    final stream = ref.watch(streamProvider);

    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod (Future Provider)"),
      ),
      body: stream.when(
        data: (data) => Center(
          child: Text(
            data.toString(),
            style: const TextStyle(fontSize: 50),
          ),
        ),
        error: (e, t) => Center(
          child: Text(e.toString()),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
