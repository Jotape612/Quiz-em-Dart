import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;

  TelaResultado(this.pontuacao, this.totalPerguntas);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Tela de Resultado")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Voce completou o Quiz!',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                "Pontuação: $pontuacao, $totalPerguntas",
                style: TextStyle(fontSize: 20),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Recomeçar"))
            ],
          ),
        ));
  }
}
