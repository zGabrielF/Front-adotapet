import 'package:adota_pet_front/Paginas/cadastroPage.dart';
import 'package:adota_pet_front/Paginas/loginPage.dart';
import 'package:flutter/material.dart';

//tela ok por enquanto

class inicialPage extends StatefulWidget {
  const inicialPage({super.key});

  @override
  inicialPageState createState() => inicialPageState();
}

class inicialPageState extends State<inicialPage> {
  late Future<String> futureData;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'AdotaPet',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Imagem do cachorro
            ClipOval(
              child: Image.network(
                'https://images.unsplash.com/photo-1552053831-71594a27632d?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwzfHxkb2d8ZW58MHx8fHwxNzEwMzQ5MzQ3fDA&ixlib=rb-4.0.3&q=80&w=1080',
                width: 200,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),
            // Botões
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    //MaterialPageRoute(builder: (context) => const listaDeUsuariosPage())
                    MaterialPageRoute(builder: (context) => const loginPage())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                foregroundColor: Colors.black
              ),
              child: const Text('Entrar'),

            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => cadastroPage())
                );

                // Ação do botão Inscreva-se
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,

                // Cor de fundo do botão
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
                  foregroundColor: Colors.white
              ),
              child: const Text('Inscreva-se'),
            ),
          ],
        ),
      ),
    );
  }
}
