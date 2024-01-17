class ChangePasswordInput {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;
  ChangePasswordInput({
    this.oldPassword = "",
    this.newPassword = "",
    this.confirmPassword = "",
  });
}