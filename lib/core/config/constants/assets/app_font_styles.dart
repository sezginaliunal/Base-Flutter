enum AppFontStyles {
  kanit('Kanit', 'Regular', 'Italic', 'Bold', 14),
  roboto('Roboto', 'Regular', 'Italic', 'Bold', 16),
  lato('Lato', 'Regular', 'Italic', 'Bold', 12);

  const AppFontStyles(
    this.fontName,
    this.regular,
    this.italic,
    this.bold,
    this.size,
  );

  final String fontName;
  final String regular;
  final String italic;
  final String bold;
  final double size;
}
