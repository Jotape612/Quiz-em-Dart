import 'package:flutter/material.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int totalPerguntas;
  final Function resetQuiz;

  TelaResultado(this.pontuacao, this.totalPerguntas, this.resetQuiz);

  @override
  Widget build(BuildContext context) {
    String imagemResultado;
    String textoResultado;

    if (pontuacao < 2) {
      imagemResultado =
          'https://media.discordapp.net/attachments/1156235571140767775/1244804117566853191/Final_ruim__a_cidade_queima.png?ex=665671ac&is=6655202c&hm=0e6d504cbac4bb642230a566bc0cf30c3d72d150dff7943061ee719039cc7741&=&format=webp&quality=lossless';
      textoResultado =
          'FINAL RUIM: Infelizmente seu poder não foi o bastante, a cidade queima!';
    } else if (pontuacao < 4) {
      imagemResultado =
          'https://media.discordapp.net/attachments/1156235571140767775/1244804117054885929/Final_medio__descanso.png?ex=665671ac&is=6655202c&hm=4b86e2c586ad25383a3491dd396eec23325f19e9b5e45637f9310a1a5e6c7e44&=&format=webp&quality=lossless';
      textoResultado =
          'FINAL MEDIO: O Colecionador cai, a cidade dorme em paz!';
    } else {
      imagemResultado =
          'https://media.discordapp.net/attachments/1156235571140767775/1244804117319258172/Final_otimo__ouro.png?ex=665671ac&is=6655202c&hm=36fd47eb7c01cc361a5c9d244a3b4c9904291b8f98421d44d5f12e87aea19b9d&=&format=webp&quality=lossless';
      textoResultado =
          'FINAL PERFEITO: Seu poder é grande, os conhecimentos do Colecionador são seus!';
    }

    return Scaffold(
      // appBar: AppBar(title: Text("Tela de Resultado")),
      body: Stack(
        children: [
          // Imagem ocupando toda a tela
          Positioned.fill(
            child: Image.network(
              'https://media.discordapp.net/attachments/1156235571140767775/1244804118581612665/Tela_de_fundo_do_app.png?ex=665671ad&is=6655202d&hm=9d97e892801b1174343ba397aace2bf2a612828c664310f01230ac1b2225d087&=&format=webp&quality=lossless',
              fit: BoxFit.cover,
            ),
          ),
          // Containers de texto e retângulo
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(imagemResultado),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(
                      5), // Padding para o retângulo preto externo
                  color: Color.fromARGB(255, 15, 11, 20), // Cor preta
                  child: Container(
                    padding: EdgeInsets.all(
                        10), // Padding para o retângulo branco interno
                    color: Colors.white, // Cor branca
                    child: Center(
                      child: Text(
                        textoResultado,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    resetQuiz();
                    Navigator.pop(context);
                  },
                  child: Text('Reiniciar Quiz'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff001527), // Cor do botão

                    onPrimary: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    minimumSize: Size(double.infinity, 40),
                  ),
                ),

                //Para a pontuação
                Text(
                  'Pontuação: $pontuacao / $totalPerguntas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
