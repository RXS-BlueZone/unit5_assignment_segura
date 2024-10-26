import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  int sum = 0;
  int difference = 0;
  int product = 0;
  double quotient = 0.0;

  // to set the input only in the specific row or operation while getting its value
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();
  TextEditingController sub1Controller = TextEditingController();
  TextEditingController sub2Controller = TextEditingController();
  TextEditingController mul1Controller = TextEditingController();
  TextEditingController mul2Controller = TextEditingController();
  TextEditingController div1Controller = TextEditingController();
  TextEditingController div2Controller = TextEditingController();

  // functions made for parsing and calculation
  void getSum() {
    setState(() {
      int firstNum = int.parse(add1Controller.text);
      int secondNum = int.parse(add2Controller.text);
      sum = firstNum + secondNum;
    });
  }

  void getDifference() {
    setState(() {
      int firstNum = int.parse(sub1Controller.text);
      int secondNum = int.parse(sub2Controller.text);
      difference = firstNum - secondNum;
    });
  }

  void getProduct() {
    setState(() {
      int firstNum = int.parse(mul1Controller.text);
      int secondNum = int.parse(mul2Controller.text);
      product = firstNum * secondNum;
    });
  }

  void getQuotient() {
    setState(() {
      int firstNum = int.parse(div1Controller.text);
      int secondNum = int.parse(div2Controller.text);
      quotient = secondNum != 0 ? firstNum / secondNum : 0.0; // for division by 0
    });
  }

  void clearSum() {
    setState(() {
      add1Controller.clear();
      add2Controller.clear();
      sum = 0;
    });
  }

  void clearDifference() {
    setState(() {
      sub1Controller.clear();
      sub2Controller.clear();
      difference = 0;
    });
  }

  void clearProduct() {
    setState(() {
      mul1Controller.clear();
      mul2Controller.clear();
      product = 0;
    });
  }

  void clearQuotient() {
    setState(() {
      div1Controller.clear();
      div2Controller.clear();
      quotient = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = $sum'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: getSum,
                  ),
                  ElevatedButton(
                    onPressed: clearSum,
                    child: const Text("Clear"),
                  ),
                ],
              ),
            ],
          ),

          // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: sub1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: sub2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = $difference'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: getDifference,
                  ),
                  ElevatedButton(
                    onPressed: clearDifference,
                    child: const Text("Clear"),
                  ),
                ],
              ),
            ],
          ),

          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: mul1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" × "),
              Expanded(
                child: TextField(
                  controller: mul2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = $product'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: getProduct,
                  ),
                  ElevatedButton(
                    onPressed: clearProduct,
                    child: const Text("Clear"),
                  ),
                ],
              ),
            ],
          ),

          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: div1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                ),
              ),
              const Text(" ÷ "),
              Expanded(
                child: TextField(
                  controller: div2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                ),
              ),
              Text(' = ${quotient.toStringAsFixed(2)}'),
              Row(
                children: [
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.divide), // imported icon from font awesome for divide icon
                    onPressed: getQuotient,
                  ),
                  ElevatedButton(
                    onPressed: clearQuotient,
                    child: const Text("Clear"),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
