class Employed {
  final String id, names, lastnames, email, password, cellphone;
  Employed({
    this.id,
    this.names,
    this.lastnames,
    this.email,
    this.password,
    this.cellphone,
  });

  Employed copyWith({
    String names,
    String lastnames,
    String email,
    String password,
    String cellphone,
  }){
    return new Employed(
      names: names ?? this.names,
      lastnames: lastnames ?? this.lastnames,
      cellphone: cellphone ?? this.cellphone,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

}
