class Usuario {
  int? _id;
  String? _nome;
  String? _nick;
  String? _senha;
  String? _telefone;

  Usuario(
      {int? id, String? nome, String? nick, String? senha, String? telefone}) {
    if (id != null) {
      this._id = id;
    }
    if (nome != null) {
      this._nome = nome;
    }
    if (nick != null) {
      this._nick = nick;
    }
    if (senha != null) {
      this._senha = senha;
    }
    if (telefone != null) {
      this._telefone = telefone;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get nome => _nome;
  set nome(String? nome) => _nome = nome;
  String? get nick => _nick;
  set nick(String? nick) => _nick = nick;
  String? get senha => _senha;
  set senha(String? senha) => _senha = senha;
  String? get telefone => _telefone;
  set telefone(String? telefone) => _telefone = telefone;

  Usuario.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nome = json['nome'];
    _nick = json['nick'];
    _senha = json['senha'];
    _telefone = json['telefone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nome'] = this._nome;
    data['nick'] = this._nick;
    data['senha'] = this._senha;
    data['telefone'] = this._telefone;
    return data;
  }
}