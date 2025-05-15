import 'package:flutter/material.dart';

class ImcController {
  double peso = 0;
  double altura = 0;

  ImcController({required this.peso, required this.altura});

  double calcular() {
    return peso / (altura * altura);
  }

  String getClassificacao(double imc) {
    if (imc < 18.5) return "Abaixo do peso";
    if (imc < 24.9) return "Peso ideal";
    if (imc < 29.9) return "Sobrepeso";
    if (imc < 39.9) return "Obesidade";
    return "Obesidade grave";
  }

  String getMensagem(double imc) {
    if (imc < 18.5)
      return "Procure um especialista para avaliar sua alimentação.";
    if (imc < 24.9)
      return "Parabéns! Continue mantendo um estilo de vida saudável.";
    if (imc < 29.9)
      return "Fique atento, talvez seja hora de rever seus hábitos.";
    if (imc < 39.9) return "Busque acompanhamento para melhorar sua saúde.";
    return "Atenção! Cuide da sua saúde com urgência.";
  }

  getCor(double imc) {
    if (imc < 18.5) return const Color(0xFFFFFF00); // amarelo
    if (imc < 24.9) return const Color(0xFF00FF00); // verde
    if (imc < 29.9) return const Color(0xFFFFA500); // laranja
    if (imc < 39.9) return const Color(0xFFFF0000); // vermelho
    return const Color(0xFF8B0000); // vermelho escuro
  }
}
