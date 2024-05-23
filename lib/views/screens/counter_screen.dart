import 'package:dars_18/controllers/counter_controller.dart';
import 'package:flutter/material.dart';

class ConuterScreen extends StatefulWidget {
  const ConuterScreen({super.key});

  @override
  State<ConuterScreen> createState() => _ConuterScreenState();
}

class _ConuterScreenState extends State<ConuterScreen> {
  final counterControler = CounterControlers();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conuter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              counterControler.value.toString(),
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              counterControler.decrament();
              setState(() {});
            },
            child: const Icon(Icons.minimize_sharp),
          ),
          FloatingActionButton(
            onPressed: () {
              counterControler.increment();
              setState(() {});
            },
            child: const Icon(Icons.add),
          )
        ],
      ),
    );
  }
}