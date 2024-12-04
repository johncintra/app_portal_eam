/*
mport 'package:flutter/material.dart';
import 'package:portal_eam/ads.dart';
import 'package:portal_eam/homepage.dart';
import 'package:portal_eam/list_working.dart';
import 'package:portal_eam/store.dart';
import 'price_calculator.dart';

class MaterialCalculator extends StatefulWidget {
  const MaterialCalculator({super.key});

  @override
  _MaterialCalculatorState createState() => _MaterialCalculatorState();
}

class _MaterialCalculatorState extends State<MaterialCalculator> {
  final _formKey = GlobalKey<FormState>();
  double fio = 0;
  double ornamentos = 0;
  double maoDeObra = 0;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cálculo de Materiais',
          style: TextStyle(fontFamily: 'Factor', color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 108, 82, 132),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 69, 64, 70), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('Valor do fio', (value) {
                fio = double.parse(value);
              }),
              _buildTextField('Ornamentos', (value) {
                ornamentos = double.parse(value);
              }),
              _buildTextField('Mão de obra', (value) {
                maoDeObra = double.parse(value);
              }),
              const SizedBox(height: 100), // Adiciona espaço entre o último campo e o botão
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    total = fio + ornamentos + maoDeObra;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PriceCalculator(
                          totalGasto: total,
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 108, 82, 132),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 32.0),
                ),
                child: const Text(
                  'Calcular Total',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF6C5284),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage()));
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
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.library_add_check),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AnnouncementsScreen()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.playlist_add_rounded),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CrochetControlScreen()));
                  },
                ),
                const SizedBox(width: 24),
                IconButton(
                  icon: const Icon(Icons.shopping_bag_outlined),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Store()));
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

  Widget _buildTextField(String label, Function(String) onSaved) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha este campo';
        }
        return null;
      },
      onSaved: (value) {
        onSaved(value!);
      },
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:portal_eam/ads.dart';
import 'package:portal_eam/homepage.dart';
import 'package:portal_eam/list_working.dart';
import 'package:portal_eam/store.dart';
import 'price_calculator.dart';

class MaterialCalculator extends StatefulWidget {
  const MaterialCalculator({super.key});

  @override
  _MaterialCalculatorState createState() => _MaterialCalculatorState();
}

class _MaterialCalculatorState extends State<MaterialCalculator> {
  final _formKey = GlobalKey<FormState>();
  double fio = 0;
  double ornamentos = 0;
  double maoDeObra = 0;
  double total = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cálculo de Materiais',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.white,
              fontFamily: 'Factor',
            ),
        ),
        backgroundColor: const Color.fromARGB(255, 108, 82, 132),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 69, 64, 70), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildTextField('Valor do fio', (value) {
                fio = double.parse(value);
              }),
              _buildTextField('Ornamentos', (value) {
                ornamentos = double.parse(value);
              }),
              _buildTextField('Mão de obra', (value) {
                maoDeObra = double.parse(value);
              }),
              const SizedBox(height: 100), // Adiciona espaço entre o último campo e o botão
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8, // 80% da largura da tela
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      total = fio + ornamentos + maoDeObra;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PriceCalculator(
                            totalGasto: total,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 108, 82, 132),
                    padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 32.0),
                  ),
                  child: const Text(
                    'Calcular Total',
                    style: TextStyle(color: Colors.white, fontSize: 20,fontFamily: 'Factor'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: const Color(0xFF6C5284),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const HomePage()));
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
          data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.library_add_check),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AnnouncementsScreen()));
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.playlist_add_rounded),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CrochetControlScreen()));
                  },
                ),
                const SizedBox(width: 24),
                IconButton(
                  icon: const Icon(Icons.featured_play_list_outlined),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Store()));
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

  Widget _buildTextField(String label, Function(String) onSaved) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencha este campo';
        }
        return null;
      },
      onSaved: (value) {
        onSaved(value!);
      },
    );
  }
}
