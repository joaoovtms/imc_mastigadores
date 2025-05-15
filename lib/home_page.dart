import 'package:flutter/material.dart';
import 'controllers/imc_controller.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  void calcularIMC() {
    final peso = double.tryParse(pesoController.text);
    final altura = double.tryParse(alturaController.text);

    if (peso != null && altura != null && altura > 0) {
      final imcController = ImcController(peso: peso, altura: altura);
      final imc = imcController.calcular();

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => ResultPage(imc: imc)),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, preencha os campos corretamente'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de IMC')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Icon(
              Icons.monitor_weight,
              size: 100,
              color: Colors.blueAccent,
            ),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Peso (kg)'),
            ),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Altura (m)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularIMC,
              child: const Text('Calcular IMC'),
            ),
          ],
        ),
      ),
    );
  }
}
