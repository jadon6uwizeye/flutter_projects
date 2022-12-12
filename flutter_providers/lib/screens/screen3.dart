import 'package:flutter/material.dart';
import 'package:flutter_providers/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Screen3 extends StatefulWidget {
  const Screen3({super.key});

  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${context.watch<Counter>().count}'),
        ),
        body: Center(
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(70),
                  child: AnimatedContainer(
                    // height as percentage of the screen height
                    height: selected
                        ? MediaQuery.of(context).size.height * 0.5
                        : MediaQuery.of(context).size.height * 0.8,
                    width: selected
                        ? MediaQuery.of(context).size.width * 0.6
                        : MediaQuery.of(context).size.width * 0.9,
                    color: selected
                        ? const Color.fromARGB(255, 30, 46, 59)
                        : const Color.fromARGB(255, 10, 1, 100),
                    // round the corners of the container
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                selected = !selected;
                              });
                            },
                            child: const Text('Animate')),
                        Text(
                            'counter is ${context.watch<Counter>().count} as of now',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        ElevatedButton(
                            onPressed: () {
                              context.read<Counter>().increment();
                            },
                            child: const Text('Increment')),
                        ElevatedButton(
                            onPressed: () {
                              context.read<Counter>().decrement();
                            },
                            child: const Text('Decrement')),
                        ElevatedButton(
                            onPressed: () {
                              context.read<Counter>().reset();
                            },
                            child: const Text('Reset')),
                      ],
                    ),
                  )),
              // const SizedBox(height: 10),
              // SizedBox(
              //   height: 50,
              //   width: 100,
              //   child: ElevatedButton(
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //       child: const Text('Back')),
              // ),
              const SizedBox(
                height: 10,
              ),
              AnimatedContainer(
                height: selected
                    ? MediaQuery.of(context).size.height * 0.25
                    : MediaQuery.of(context).size.height * 0.05,
                color: Colors.green,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
              )
            ],
          ),
        ));
  }
}
