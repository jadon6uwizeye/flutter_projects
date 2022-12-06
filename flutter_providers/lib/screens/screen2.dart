import 'package:flutter/material.dart';
import 'package:flutter_providers/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${context.watch<Counter>().count}'),
      ),
      body: Center(
          child:
              Text('counter is ${context.watch<Counter>().count} as of now')),
    );
  }
}
