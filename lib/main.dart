import 'package:adota_pet_front/Paginas/listaUsuariosPage.dart';
import 'package:adota_pet_front/Paginas/inicialPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const ListaDeUsuarios()
      //home: const inicialPage()
    );
  }
}



