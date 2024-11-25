import 'package:flutter/material.dart';
import 'dart:math';
import 'home_page2.dart';

class HomePage1 extends StatefulWidget {
  @override
  HomePage1State createState() => HomePage1State();
}

class HomePage1State extends State<HomePage1> {
  final List<String> palavras = [
    'Dart', 'Flutter', 'Programação', 'Código', 'Variável',
    'Função', 'Classe', 'Objeto', 'Lista', 'Mapa'
  ];
  final Map<String, String> dicas = {
    'Dart': 'Linguagem de programação usada principalmente para desenvolvimento web e mobile.',
    'Flutter': 'Framework para criar aplicativos nativos com uma única base de código.',
    'Programação': 'Processo de escrever código para criar software.',
    'Código': 'Conjunto de instruções escritas em uma linguagem de programação.',
    'Variável': 'Espaço na memória para armazenar dados.',
    'Função': 'Bloco de código que executa uma tarefa específica.',
    'Classe': 'Modelo para criar objetos com propriedades e métodos.',
    'Objeto': 'Instância de uma classe.',
    'Lista': 'Coleção ordenada de elementos.',
    'Mapa': 'Coleção de pares chave-valor.'
  };

  late String palavraSorteada;
  late String dica;
  final TextEditingController _controller = TextEditingController();
  bool mostrarResposta = false;

  @override
  void initState() {
    super.initState();
    sortearPalavra();
  }

  void sortearPalavra() {
    final random = Random();
    palavraSorteada = palavras[random.nextInt(palavras.length)];
    dica = dicas[palavraSorteada]!;
    mostrarResposta = false;
  }

  void verificarPalavra(BuildContext context) {
    if (_controller.text.toLowerCase() == palavraSorteada.toLowerCase()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Parabéns! Você acertou!')),
      );
      sortearPalavra();
      _controller.clear();
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage2(
            palavra: palavraSorteada,
            dica: dica,
            mostrarResposta: mostrarResposta,
            tentarNovamente: () {
              setState(() {
                mostrarResposta = true;
              });
              Navigator.pop(context);
            },
            novaPalavra: () {
              sortearPalavra();
              _controller.clear();
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Center(child: Text('Jogo de Palavras'),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Tente adivinhar a palavra'),
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () => verificarPalavra(context),
                child: Text('Verificar'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.orangeAccent,
    );
  }
}
