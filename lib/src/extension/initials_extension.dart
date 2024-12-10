extension Initials on String {
  String get initials {
    String result = "";
    List<String> words = split(" ");
    for (var element in words) {
      if (element.trim().isNotEmpty && result.length < 2) {
        result += element[0].trim();
      }
    }
    return result.trim().toUpperCase();
  }
}
