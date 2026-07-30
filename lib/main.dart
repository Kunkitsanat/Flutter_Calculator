import 'package:flutter/material.dart';
import 'package:simple_calc/calculate.dart';

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

  String _result = "";
  String operator = "";

  List <String> history = [];

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

                Expanded(child: Text(operator,style: TextStyle(fontSize: 32),textAlign: TextAlign.center,)),

                Expanded(child: TextField(
                  controller: _num2,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'num2',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 25)
                  ))
                  ),

                const SizedBox(width: 10),

                const Expanded(child: Center(child: Text('=', style: TextStyle(fontSize: 32)))),

                Expanded(child: Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),

                  child: Text(
                  _result.isEmpty ? "0" : _result,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                 ),
                ))
              ]
            ),

            const SizedBox(width: 10,height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  setState(() {
                    _result = calculate(double.tryParse(_num1.text) ?? 0, '+', double.tryParse(_num2.text) ?? 0);
                    operator = '+';
                    history.add("${_num1.text} + ${_num2.text} = ${_result}");
                  });
                },child: const Text('+',style: TextStyle(fontSize: 32),)),

                const SizedBox(width: 20),

                ElevatedButton(onPressed: (){
                  setState(() {
                    _result = calculate(double.tryParse(_num1.text) ?? 0, '-', double.tryParse(_num2.text) ?? 0);
                    operator = '-';
                    history.add("${_num1.text} - ${_num2.text} = ${_result}");
                  });
                },child: const Text('-',style: TextStyle(fontSize: 32),)),

                const SizedBox(width: 20),

                ElevatedButton(onPressed: (){
                  setState(() {
                    _result = calculate(double.tryParse(_num1.text) ?? 0, '*', double.tryParse(_num2.text) ?? 0);
                    operator = 'x';
                    history.add("${_num1.text} x ${_num2.text} = ${_result}");
                  });
                },child: const Text('x',style: TextStyle(fontSize: 32),)),

                const SizedBox(width: 20),

                ElevatedButton(onPressed: (){
                  setState(() {
                    _result = calculate(double.tryParse(_num1.text) ?? 0, '/', double.tryParse(_num2.text) ?? 0);
                    operator = '÷';
                    history.add("${_num1.text} ÷ ${_num2.text} = ${_result}");
                  });
                },child: const Text('÷',style: TextStyle(fontSize: 32),)),
              ])
          ],
        ),
      ),
    );
  }
}
