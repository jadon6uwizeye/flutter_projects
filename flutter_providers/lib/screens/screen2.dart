import 'package:flutter/material.dart';
import 'package:flutter_providers/providers/counter_provider.dart';
import 'package:flutter_providers/screens/screen3.dart';
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('counter is ${context.watch<Counter>().count} as of now'),
            ElevatedButton(
                onPressed: () {
                  context.read<Counter>().increment();
                },
                child: const Text('Increment')),
          ],
        ),
      ),
      // button on the bottom
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // navigate to screen3
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Screen3()),
          );
        },
        tooltip: 'Next',
        child: const Icon(Icons.navigate_next_outlined),
      ),
    );
  }
}
