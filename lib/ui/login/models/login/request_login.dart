class RequestLogin {
  final int idSocial;
  final String name;
  final String lastName;
  final String socialFoto;
  final String email;

  RequestLogin(
      {this.idSocial, this.name, this.lastName, this.socialFoto, this.email});
}
