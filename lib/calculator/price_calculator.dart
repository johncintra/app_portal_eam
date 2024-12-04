/*
import 'package:flutter/material.dart';

class PriceCalculator extends StatefulWidget {
  final double totalGasto;

  const PriceCalculator({super.key, required this.totalGasto});

  @override
  _PriceCalculatorState createState() => _PriceCalculatorState();
}

class _PriceCalculatorState extends State<PriceCalculator> {
  final _formKey = GlobalKey<FormState>();
  double frete = 0;
  double embalagem = 0;
  double etiqueta = 0;
  double lucroFinal = 0;
  double totalFinal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cálculo Preço Final', style: TextStyle(color: Colors.white, fontFamily: 'Factor'),),
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
              Text(
                'Total gasto (Material + Mão de obra): R\$ ${widget.totalGasto.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              _buildTextField('Custo de frete', (value) {
                frete = double.parse(value);
              }),
              _buildTextField('Custo de embalagem', (value) {
                embalagem = double.parse(value);
              }),
              _buildTextField('Custo de etiqueta', (value) {
                etiqueta = double.parse(value);
              }),
              _buildTextField('Porcentagem de lucro final', (value) {
                lucroFinal = double.parse(value);
              }),
              const SizedBox(height: 100),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    totalFinal = widget.totalGasto + frete + embalagem + etiqueta;
                    totalFinal += (lucroFinal / 100) * totalFinal;

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Resultado Final'),
                          content: Text('Valor total para vender: R\$ ${totalFinal.toStringAsFixed(2)}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 108, 82, 132),
                ),
                child: const Text(
                  'Calcular Valor de Venda',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
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

class PriceCalculator extends StatefulWidget {
  final double totalGasto;

  const PriceCalculator({super.key, required this.totalGasto});

  @override
  _PriceCalculatorState createState() => _PriceCalculatorState();
}

class _PriceCalculatorState extends State<PriceCalculator> {
  final _formKey = GlobalKey<FormState>();
  double frete = 0;
  double embalagem = 0;
  double etiqueta = 0;
  double lucroFinal = 0;
  double totalFinal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cálculo Preço Final',
          style: TextStyle(color: Colors.white, fontFamily: 'Factor'),
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
              Text(
                'Total gasto (Material + Mão de obra): R\$ ${widget.totalGasto.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              _buildTextField('Custo de frete', (value) {
                frete = double.parse(value);
              }),
              _buildTextField('Custo de embalagem', (value) {
                embalagem = double.parse(value);
              }),
              _buildTextField('Custo de etiqueta', (value) {
                etiqueta = double.parse(value);
              }),
              _buildTextField('Porcentagem de lucro final', (value) {
                lucroFinal = double.parse(value);
              }),
              const SizedBox(height: 100), // Espaço adicional antes do botão
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    totalFinal = widget.totalGasto + frete + embalagem + etiqueta;
                    totalFinal += (lucroFinal / 100) * totalFinal;

                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Resultado Final'),
                          content: Text('Valor total para vender: R\$ ${totalFinal.toStringAsFixed(2)}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Ok'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 108, 82, 132),
                  padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 32.0),
                ),
                child: const Text(
                  'Calcular Valor de Venda',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontFamily: 'Factor'),
                ),
              ),
            ],
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
