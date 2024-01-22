import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testapp/riverpod_providers/future_provider_example.dart/api_service.dart';
import 'package:testapp/riverpod_providers/future_provider_example.dart/user_model.dart';

//Provider instance
final apiProvider = Provider<ApiService>(
  (ref) => ApiService(),
);

//Future Provider
FutureProvider? userDataProvider;

class FutureProviderExample extends ConsumerStatefulWidget {
  const FutureProviderExample({super.key});

  @override
  ConsumerState<FutureProviderExample> createState() => _FutureProviderExampleState();
}

class _FutureProviderExampleState extends ConsumerState<FutureProviderExample> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    userDataProvider = FutureProvider<List<UserModel>>(
      (ref) => ref.read(apiProvider).getUsers(),
    );
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userDataProvider = null; 
  }

  @override
  Widget build(BuildContext context) {
    // to get future provider instance using Stateless widget
    final userData = ref.watch(userDataProvider!);

    print("rebuild");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Riverpod (Future Provider)"),
      ),
      body: userData.when(
        data: (data) => ListView.builder(
          itemCount: data.length,
          itemBuilder: (_, i) => ListTile(
            title: Text("${data[i].firstName} ${data[i].lastName}"),
            subtitle: Text(data[i].email),
            leading: Image.network(data[i].avatar),
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


