import 'package:adota_pet_front/Modelos/Usuario.dart';
import 'package:flutter/material.dart';
import 'package:adota_pet_front/Api/api.dart';

//Tela ok por enquanto

class ListaDeUsuarios extends StatefulWidget {
  const ListaDeUsuarios({super.key});

  @override
  ListaUsuariosState createState() => ListaUsuariosState();
}

class ListaUsuariosState extends State<ListaDeUsuarios> {
  late Future<List<Usuario>> futureUsuarios;

  @override
  void initState() {
    super.initState();
    futureUsuarios = api.getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<Usuario>>(
        future: futureUsuarios,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Nenhum usuário encontrado.'));
          } else {
            List<Usuario> usuarios = snapshot.data!;
            return ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (context, index) {
                Usuario usuario = usuarios[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 5,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16.0),
                    title: Text(
                      usuario.nome ?? 'Nome não disponível',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8.0),
                        Text(
                          'ID: ${usuario.id ?? 'Não disponível'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Nick: ${usuario.nick ?? 'Não disponível'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          'Telefone: ${usuario.telefone ?? 'Não disponível'}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    isThreeLine: true, // Expande o ListTile para mostrar múltiplas linhas
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

