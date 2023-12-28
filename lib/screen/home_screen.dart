import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counterValue = 0;

  void increaseNumber() => setState(() => counterValue++);

  void decreaseNumber() => setState(() => counterValue--);

  @override
  Widget build(BuildContext context) {
    print('Whole \'HomeScreen\' built');

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
              child: Text(
                'Counter value: $counterValue',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
