import 'package:flutter/material.dart';
import 'tela_destino.dart';

class TelaQuiz extends StatefulWidget {
  const TelaQuiz({super.key});

  @override
  _TelaQuizState createState() => _TelaQuizState();
}

class _TelaQuizState extends State<TelaQuiz> {
  int _perguntaAtual = 0;
  int _pontuacao = 0;
  //Boleana para checar resposta
  bool? _respostaCorreta;
  String _imagemAtual =
      'https://media.discordapp.net/attachments/1156235571140767775/1244804118053261372/Primeira_pergunta.png?ex=665671ad&is=6655202d&hm=a6e246758588adfad32e2eb14c4723ea088077732451fc244e0501e5c262b69c&=&format=webp&quality=lossless';

  final List<Pergunta> _perguntas = [
    Pergunta(
      textoIntroducao:
          'O Colecionador te cumprimenta sadicamente e já começa seus enigmas.',
      pergunta:
          'Primeiro Enigma: Há muito para os pobres, nada para os ricos. Comigo você morre, comigo nada vive. O que sou?',
      respostas: ['Dinheiro', 'Tempo', 'Guerra', 'Vazio'],
      respostaCorreta: 'Vazio',
      imagem:
          'https://media.discordapp.net/attachments/1156235571140767775/1244804118053261372/Primeira_pergunta.png?ex=665671ad&is=6655202d&hm=a6e246758588adfad32e2eb14c4723ea088077732451fc244e0501e5c262b69c&=&format=webp&quality=lossless',
    ),
    Pergunta(
      textoIntroducao: 'Ele fica sério, talvez tenha te subestimado.',
      pergunta: 'Segundo Enigma: O que sempre caminha mas nunca chega ao fim?',
      respostas: ['Guerra', 'Fome', 'Tempo', 'Morte'],
      respostaCorreta: 'Tempo',
      imagem:
          'https://media.discordapp.net/attachments/1156235571140767775/1244804118309244948/Segunda_pergunta.png?ex=665671ad&is=6655202d&hm=ccee50a0a0b51dbcdc2890eb274a446a0e3b3b216110e15acc8dbeac14e32cc3&=&format=webp&quality=lossless',
    ),
    Pergunta(
      textoIntroducao: 'Ele revela a face dos outros antes de você.',
      pergunta:
          'Terceiro Enigma: Qual é o estado de completa ausência de luz, onde nenhum ser pode viver?',
      respostas: ['Sombra', 'Escuridão', 'Noite', 'Vácuo'],
      respostaCorreta: 'Vácuo',
      imagem:
          'https://media.discordapp.net/attachments/1156235571140767775/1244804564398379028/Terceira_pergunta.png?ex=66567217&is=66552097&hm=30e5d62f8279a9374b58e1bd2f7101909f183ba7e2aeadfaad186f07838690b0&=&format=webp&quality=lossless&width=550&height=309',
    ),
    Pergunta(
      textoIntroducao: 'Seu plano de existência está fragmentado.',
      pergunta:
          'Enigma final: Eu sou o fim de tudo e de todos, ninguém pode me evitar. O que sou?',
      respostas: ['Esquecimento', 'Desastre', 'Destino', 'Morte'],
      respostaCorreta: 'Morte',
      imagem:
          'https://media.discordapp.net/attachments/1156235571140767775/1244804768250069023/Ultima_pergunta_copiar.png?ex=66567248&is=665520c8&hm=788cb56827cb0b751b971e1a6e766fe87b8af5a6086747ede638d5b9065e8ac8&=&format=webp&quality=lossless',
    ),
  ];

  void resetQuiz() {
    setState(() {
      _perguntaAtual = 0;
      _pontuacao = 0;
    });
    Navigator.pop(context);
  }

  void _responderPergunta(String resposta) {
    setState(() {
      _respostaCorreta = _perguntas[_perguntaAtual].respostaCorreta == resposta;
      if (_respostaCorreta!) {
        _pontuacao++;
        _imagemAtual =
            'https://media.discordapp.net/attachments/1156235571140767775/1244804117809860658/Pergunta_certa.png?ex=665671ad&is=6655202d&hm=a04a84a872cb9778ad89403d628d0814997d11fb81c35e1d4093377605d8df68&=&format=webp&quality=lossless'; // Imagem para resposta correta
      } else {
        _imagemAtual =
            'https://media.discordapp.net/attachments/1156235571140767775/1244805055006380092/Pergunta_errada_.png?ex=6656728c&is=6655210c&hm=8c90827cda3c96a4466f1229bb09e787a6682681fe195111162c35144840619c&=&format=webp&quality=lossless'; // Imagem para resposta errada
      }
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _respostaCorreta = null;
        if (_perguntaAtual < _perguntas.length - 1) {
          _perguntaAtual++;
          _imagemAtual = _perguntas[_perguntaAtual].imagem;
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  TelaResultado(_pontuacao, _perguntas.length, resetQuiz),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Quiz')),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              'https://media.discordapp.net/attachments/1156235571140767775/1244804118581612665/Tela_de_fundo_do_app.png?ex=665671ad&is=6655202d&hm=9d97e892801b1174343ba397aace2bf2a612828c664310f01230ac1b2225d087&=&format=webp&quality=lossless',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              // Parte da imagem
              Image.network(
                _imagemAtual,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
              // Parte do texto com as perguntas e respostas
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    if (_perguntaAtual == 0)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          _perguntas[_perguntaAtual].textoIntroducao,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    if (_respostaCorreta != null)
                      Column(
                        children: [
                          SizedBox(height: 20),
                          Text(
                            _respostaCorreta!
                                ? 'Você acertou, o Colecionador congela e você ataca!'
                                : 'Você errou, o Colecionador toma sua mente!',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffe5e5e5),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        color: Color.fromARGB(255, 15, 11, 20),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          color: Color(0xffe5e5e5),
                          child: Text(
                            _perguntas[_perguntaAtual].pergunta,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    ...(_perguntas[_perguntaAtual].respostas).map((resposta) {
                      return ElevatedButton(
                        onPressed: () {
                          _responderPergunta(resposta);
                        },
                        child: Text(resposta),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff001527), // Cor do botão
                          onPrimary: Colors.white, // Cor do texto do botão
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Pergunta {
  final String textoIntroducao;
  final String pergunta;
  final List<String> respostas;
  final String respostaCorreta;
  final String imagem;

  Pergunta({
    required this.textoIntroducao,
    required this.pergunta,
    required this.respostas,
    required this.respostaCorreta,
    required this.imagem,
  });
}
