import 'package:flutter/material.dart';

class BlogView extends StatelessWidget {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          "Blog",
          style: Theme.of(context).textTheme.titleLarge,
        ),
     );
  }
}
