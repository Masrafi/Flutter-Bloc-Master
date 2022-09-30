abstract class SignUpEvent {}

class SignUpTextChangeEvent extends SignUpEvent {
  final String fNameValue;
  final String lNameValue;
  final String emailValue;
  final String passValue;

  SignUpTextChangeEvent(
    this.fNameValue,
    this.lNameValue,
    this.emailValue,
    this.passValue,
  );
}

class SignUpTextSubmitEvent extends SignUpEvent {
  final String fName;
  final String lName;
  final String email;
  final String pass;

  SignUpTextSubmitEvent(
    this.fName,
    this.lName,
    this.email,
    this.pass,
  );
}
