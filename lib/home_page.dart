import 'package:flutter/material.dart';
import 'controllers/imc_controller.dart';

class ResultPage extends StatelessWidget {
  final double imc;

  const ResultPage({super.key, required this.imc});

  @override
  Widget build(BuildContext context) {
    final controller = ImcController(peso: 1, altura: 1);
    final classificacao = controller.getClassificacao(imc);
    final cor = controller.getCor(imc);
    final mensagem = controller.getMensagem(imc);

    return Scaffold(
      appBar: AppBar(title: const Text('Resultado')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: cor, width: 4),
              borderRadius: BorderRadius.circular(16),
              boxShadow: const [
                BoxShadow(color: Colors.black12, blurRadius: 8),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite, size: 80, color: cor),
                const SizedBox(height: 16),
                Text(
                  'Seu IMC é:',
                  style: TextStyle(fontSize: 24, color: Color(0xFF00123C)),
                ),
                const SizedBox(height: 8),
                Text(
                  imc.toStringAsFixed(2),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: cor,
                  ),
                ),
                const SizedBox(height: 16),
                Text(classificacao, style: TextStyle(fontSize: 22, color: cor)),
                const SizedBox(height: 12),
                Text(
                  mensagem,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
