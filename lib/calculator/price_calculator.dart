import 'package:flutter/material.dart';
import 'package:portal_eam/calculator/calculator.dart';
import 'package:portal_eam/homepage.dart';
import 'package:portal_eam/store.dart';

class PriceCalculator extends StatefulWidget {
  final double totalCost;

  const PriceCalculator({super.key, required this.totalCost});

  @override
  _PriceCalculatorState createState() => _PriceCalculatorState();
}

class _PriceCalculatorState extends State<PriceCalculator> {
  final _shippingCostController = TextEditingController();
  final _packagingCostController = TextEditingController();
  final _profitPercentageController = TextEditingController();
  double _finalPrice = 0.0;

  void _calculateFinalPrice() {
    final double shippingCost = double.parse(_shippingCostController.text);
    final double packagingCost = double.parse(_packagingCostController.text);
    final double profitPercentage =
        double.parse(_profitPercentageController.text);

    final double totalCost = widget.totalCost + shippingCost + packagingCost;
    final double profit = totalCost * (profitPercentage / 100);
    setState(() {
      _finalPrice = totalCost + profit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6C5284),
        title: const Text(
          'Calcular Preço Final',
          style: TextStyle(color: Colors.white, fontFamily: 'Factor'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              'Custo Total do Material: R\$${widget.totalCost.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _shippingCostController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Custo do Frete',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _packagingCostController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Custo da Embalagem',
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: _profitPercentageController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Porcentagem de Lucro (%)',
              ),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              onPressed: _calculateFinalPrice,
              child: const Text(
                'Calcular Preço Final',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Preço Final: R\$$_finalPrice',
              style: const TextStyle(
                fontSize: 30,
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
