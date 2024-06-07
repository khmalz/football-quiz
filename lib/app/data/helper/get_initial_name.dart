String getInitialName(String name, int? length) {
  String initials = "";
  name = name.trim();
  if (name.isNotEmpty) {
    List<String> nameParts =
        name.split(' ').where((part) => part.isNotEmpty).toList();
    if (nameParts.isNotEmpty) {
      initials = nameParts.map((e) => e[0]).take(length ?? 2).join();
    }
  }
  return initials;
}
