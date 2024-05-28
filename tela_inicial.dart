import 'package:flutter/material.dart';
import 'quiz_2.dart';

class TelaInicial extends StatefulWidget {
  @override
  _TelaInicialState createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  String backgroundImage =
      'https://media.discordapp.net/attachments/1156235571140767775/1244802629591371856/Tela_Inicial.png?ex=6656704a&is=66551eca&hm=323e22a1685cb0c80bd125470077bfa495d7773b05b160c0a4cef3e44ccc1b0c&=&format=webp&quality=lossless';
  bool showMessage = false;
  bool showButton = true;

  void changeBackgroundImage() {
    setState(() {
      backgroundImage =
          'https://media.discordapp.net/attachments/1156235571140767775/1244804118581612665/Tela_de_fundo_do_app.png?ex=665671ad&is=6655202d&hm=9d97e892801b1174343ba397aace2bf2a612828c664310f01230ac1b2225d087&=&format=webp&quality=lossless';
      showMessage = true;
      showButton = true;
    });

    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TelaQuiz()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar(title: Text("Tela Inicial")),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              backgroundImage,
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (!showMessage)
                  Text(
                    'Há um monstro nas ruínas. Deseja avançar?',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 20),
                if (showButton)
                  ElevatedButton(
                    onPressed: changeBackgroundImage,
                    child: Text('Avançar'),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff001527),
                      onPrimary: Colors.white,
                    ),
                  ),
                if (showMessage)
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'O Colecionador se alimenta de erros. Ataque-o quando acertar seus enigmas, reze quando errar!',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
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
