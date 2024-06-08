import 'package:flutter/material.dart';
import 'package:portal_eam/calculator/price_calculator.dart';

class MaterialCalculator extends StatefulWidget {
  const MaterialCalculator({super.key});

  @override
  _MaterialCalculatorState createState() => _MaterialCalculatorState();
}

class _MaterialCalculatorState extends State<MaterialCalculator> {
  final _unitPriceController = TextEditingController();
  final _quantityController = TextEditingController();
  double _totalCost = 0.0;

  void _calculateTotalCost() {
    final double unitPrice = double.parse(_unitPriceController.text);
    final double quantity = double.parse(_quantityController.text);
    setState(() {
      _totalCost = unitPrice * quantity;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PriceCalculator(totalCost: _totalCost),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[300],
        title: const Text('Calcular Custo do Material'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 243, 213, 248),
            Color.fromARGB(255, 123, 48, 136)
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _unitPriceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Preço Unitário do Material',
                ),
              ),
              TextField(
                controller: _quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Quantidade de Material',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateTotalCost,
                child: const Text('Calcular Custo Total'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
