import 'package:flutter/material.dart';
import 'package:adota_pet_front/Api/api.dart';
import 'package:adota_pet_front/Paginas/listaUsuariosPage.dart';

// tela ok por enquanto

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
  final TextEditingController _nickController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _nickErrorText;
  String? _passwordErrorText;

  void _login() async {
    setState(() {
      _nickErrorText = _nickController.text.isEmpty ? 'Por favor, insira seu usuário' : null;
      _passwordErrorText = _passwordController.text.isEmpty ? 'Por favor, insira sua senha' : null;
    });

    if (_nickErrorText != null || _passwordErrorText != null) {
      return;
    }

    String nick = _nickController.text.trim();
    String password = _passwordController.text.trim();

    try {
      bool loginSuccesso = await api.login(nick: nick, senha: password);
      if (loginSuccesso) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => listaDeUsuariosPage()),
        );
      } else {

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Falhou'),
              content: Text('Usuário ou senha inválidos.'),
              actions: <Widget>[
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } catch (e) {

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Falhou'),
            content: Text('Ocorreu um erro durante o login.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      print('Exception during login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Login',
          style: TextStyle(
            fontFamily: 'Outfit',
            color: Colors.white,
            fontSize: 30,
            letterSpacing: 0,
            fontWeight: FontWeight.normal,
          ),
        ),
        centerTitle: false,
        elevation: 2,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _nickController,
              decoration: InputDecoration(
                labelText: 'Usuário',
                border: OutlineInputBorder(),
                errorText: _nickErrorText,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
                errorText: _passwordErrorText,
              ),
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Entrar'),
            ),
          ],
        ),
      ),
    );
  }
}
