class Label {
  final String name;
  final int id;
  // Consider adding iconUrls if needed

  Label({
    required this.name,
    required this.id,
});

factory Label.fromJson(Map<String, dynamic> json) {
  return Label(
      name: json['name'],
      id: json['id'],
    );
  }
}