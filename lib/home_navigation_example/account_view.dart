import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Text(
          "Account",
          style: Theme.of(context).textTheme.titleLarge,
        ),
    );
  }
}
