import 'package:flutter/material.dart';

class G {
  static void goto (BuildContext context,Widget route)=> Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => route,
                      ),
                    );
}