import 'package:flutter/material.dart';

class HomePage2 extends StatelessWidget {
  final String palavra;
  final String dica;
  final bool mostrarResposta;
  final VoidCallback tentarNovamente;
  final VoidCallback novaPalavra;

  HomePage2({
    required this.palavra,
    required this.dica,
    required this.mostrarResposta,
    required this.tentarNovamente,
    required this.novaPalavra,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Center(child: Text('Dica'),)
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você errou! Tente novamente.',
              style: TextStyle(fontSize: 44, color: Colors.red),
            ),
            SizedBox(height: 20),
            Text('Dica: $dica'),
            if (mostrarResposta) ...[
              SizedBox(height: 20),
              Text('Resposta: $palavra', style: TextStyle(fontSize: 20, color: Colors.white)),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: tentarNovamente,
              child: Text('Tentar Novamente', style: TextStyle(color: Colors.black),),
            ),
            if (mostrarResposta) ...[
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: novaPalavra,
                child: Text('Palavra inicial', style: TextStyle(color: Colors.black)),
              ),
            ],
          ],
        ),
      ),
      backgroundColor: Colors.orangeAccent,
    );
  }
}
