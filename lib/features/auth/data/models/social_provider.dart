enum SocialProvider {
  google,
  facebook,
  apple;

  String get displayName => switch (this) {
    SocialProvider.google => 'Google',
    SocialProvider.facebook => 'Facebook',
    SocialProvider.apple => 'Apple',
  };
}
