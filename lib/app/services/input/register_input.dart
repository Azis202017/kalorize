class RegisterInput {
  String nama;
  String email;
  String password;
  String passwordConfirmation;
  String? kodeGym;
  String? kodeReferral;
  RegisterInput({
    required this.nama,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    this.kodeGym = "",
    this.kodeReferral = "",
  });
}
