extension StringExtensions on String {
  bool get isValidEmail {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(this);
  }

  bool containsOnlyNumbers(String text) {
    if(text.length<10){
     return false;
    }
    final RegExp regex = RegExp(r'^[0-9]+$');
    return regex.hasMatch(text);
  }

  bool isValidPhone() {
    return (this.length == 10);
  }

  bool isAge(String? s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool isValidUrl() {
    return Uri.parse(this).isAbsolute;
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }

  String removeSpecialCharacters() {
    return this.replaceAll(RegExp('&amp;'), '');
  }
}
