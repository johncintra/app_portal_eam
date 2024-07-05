import 'package:flutter/material.dart';
import 'package:portal_eam/calculator/price_calculator.dart';
import 'package:portal_eam/homepage.dart';
import 'package:portal_eam/store.dart';

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
        backgroundColor: const Color(0xFF6C5284),
        title: const Text(
          'Calcular Custo do Material',
          style: TextStyle(color: Colors.white, fontFamily: 'Factor'),
        ),
      ),
      body: Padding(
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
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade de Material',
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: _calculateTotalCost,
              child: const Text(
                'Calcular Custo Total',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF6C5284),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        },
        child: const Icon(
          Icons.home,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color(0xFF6C5284),
        child: IconTheme(
          //Theme.of(context).colorScheme.onPrimary
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.contact_support_outlined),
                  onPressed: () {},
                ),
                const SizedBox(
                  width: 24,
                ),
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Store()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.calculate_outlined),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MaterialCalculator()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
