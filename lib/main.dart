import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 253, 84, 0))),
      home: const SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _CalculatorPage();
}

class _CalculatorPage extends State<SimpleCalculator> {
  final TextEditingController _num1 = TextEditingController();
  final TextEditingController _num2 = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: TextField(
                  controller: _num1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'num1',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25)
                  )),  
                ),

                const SizedBox(width: 10),

                Expanded(child: TextField(
                  controller: _num2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'num2',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25)
                  ))
                  ),
              ]
            )
          ],
        ),
      ),
    );
  }
}
