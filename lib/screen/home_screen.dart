import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/counter_bloc/counter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');

    final counterBloc = context.read<CounterBloc>();

    void increaseNumber() => counterBloc.add(CounterIncrementEvent());
    void decreaseNumber() => counterBloc.add(CounterDecrementEvent());

    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Counter value
            Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    'Counter value: ${state.counterValue}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
            ),
            // Space
            SizedBox(height: 20),
            // Button Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Decrease button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: decreaseNumber,
                      icon: Icon(Icons.remove),
                      label: Text('Decrease'),
                    ),
                  ),
                  // Space
                  SizedBox(width: 30),
                  // Increase button
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: increaseNumber,
                      icon: Icon(Icons.add),
                      label: Text('Increase'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
