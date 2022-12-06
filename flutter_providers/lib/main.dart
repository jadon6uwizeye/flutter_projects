import 'package:flutter/material.dart';
import 'package:flutter_providers/providers/counter_provider.dart';
import 'package:flutter_providers/screens/screen2.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => Counter(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '${context.watch<Counter>().count}',
              style: Theme.of(context).textTheme.headline4,
            ),
            FloatingActionButton(
                onPressed: (() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Screen2()),
                  );
                }),
                tooltip: 'next screen',
                child: const Icon(Icons.skip_next))
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().increment();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().reset();
            },
            tooltip: 'reset',
            child: const Icon(Icons.exposure_zero),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              context.read<Counter>().decrement();
            },
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
