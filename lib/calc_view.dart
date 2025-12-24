import 'package:calculator_flutter_app/calc_logic.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorLogic logic = CalculatorLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // ================= Display =================
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    logic.expression,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    logic.result,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // ================= Buttons =================
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    buildRow(["7", "8", "9", "÷"]),
                    buildRow(["4", "5", "6", "×"]),
                    buildRow(["1", "2", "3", "−"]),
                    buildLastRow(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ================= Button =================
  Widget buildButton({
    required String text,
    bool isOperator = false,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              logic.onButtonPressed(text);
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: isOperator ? Colors.black45 : Colors.grey[300],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isOperator ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLastRow() {
    return Expanded(
      child: Row(
        children: [
          buildButton(text: "0", flex: 2),
          buildButton(text: "c", isOperator: true),
          buildButton(text: "=", isOperator: true),
          buildButton(text: "+", isOperator: true),
        ],
      ),
    );
  }

  Widget buildRow(List<String> labels) {
    return Expanded(
      child: Row(
        children: labels.map((label) {
          return buildButton(
            text: label,
            isOperator: isOperator(label),
          );
        }).toList(),
      ),
    );
  }

  bool isOperator(String text) {
    return ["+", "−", "×", "÷", "="].contains(text);
  }
}
