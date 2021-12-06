class UserState {
  UserState({
    this.text = '',
    this.errorMailText = '',
    this.errorPasswordText = '',
  });
  final String text;
  final String errorMailText;
  final String errorPasswordText;

  UserState copyWith({
    String? text,
    String? errorMailText,
    String? errorPasswordText,
  }) {
    return UserState(
      text: text ?? this.text,
      errorMailText: errorMailText ?? this.errorMailText,
      errorPasswordText: errorPasswordText ?? this.errorPasswordText,
    );
  }

  @override
  String toString() =>
      'UserState(text: $text, errorMailText: $errorMailText, errorPasswordText: $errorPasswordText)';
}
