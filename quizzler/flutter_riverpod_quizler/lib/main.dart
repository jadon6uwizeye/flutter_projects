import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider<int>((ref) => 0);

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var counter = ref.watch(counterProvider);
    // counter = 0;
    return MaterialApp(
      // hide debug banner
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 14, 6, 36),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Center(
              child:
                  Text('You have pushed the button this many times: $counter',
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        color: Colors.white,
                      )),
            ),
          ),
        ),
        // RaisedButton
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // encrement counter
            ref.read(counterProvider.notifier).state++;
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
