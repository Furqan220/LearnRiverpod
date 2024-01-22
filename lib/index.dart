import 'package:flutter/material.dart';
import 'package:testapp/global.dart';
import 'package:testapp/type_of_providers.dart';


class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
       appBar: AppBar(
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text("Learn Riverpod"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => G.goto(context, const ProviderIndexView()),
            child: const Text("Types of Provider"))
          ],
        ),
      ),
    );
  }
}

