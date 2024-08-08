import 'dart:convert'; //
import 'package:http/http.dart' as http;
import 'package:adota_pet_front/Modelos/Usuario.dart';

const baseUrl = "http://localhost:8080";

class api {

  static Future<List<Usuario>> getUsuarios() async {
    var url = Uri.parse("$baseUrl/usuarios");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      return jsonData.map((json) => Usuario.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar usuários');
    }
  }

  static Future<bool> cadastrarUsuario({
    required String nome,
    required String nick,
    required String telefone,
    required String senha,
  }) async {
    var url = Uri.parse("$baseUrl/usuarios");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nome': nome,
        'nick': nick,
        'telefone': telefone,
        'senha': senha,
      }),
    );

    //print('Status code: ${response.statusCode}');
    //print('Response body: ${response.body}');

    if (response.statusCode == 200 || response.statusCode == 201 ) {
      print('Cadastro realizado com sucesso');
      return true;
    } else {
      print('Falha ao cadastrar: ${response.body}');
      return false;
    }
  }

  static Future<bool> login({
    required String nick,
    required String senha,
  }) async {
    var url = Uri.parse("$baseUrl/login");
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'nick': nick,
        'senha': senha,
      }),
    );

    //print('Status code: ${response.statusCode}');
    //print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      print('Login realizado com sucesso');
      return true;
    } else {
      print('Falha no login: ${response.body}');
      return false;
    }
  }

}

