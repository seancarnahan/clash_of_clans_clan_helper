class League {
  final String name;
  final int id;
  // Consider adding iconUrls if needed

  League({required this.name, required this.id});

  factory League.fromJson(Map<String, dynamic> json) {
    return League(
      name: json['name'] ?? 'Unknown', // Assuming 'name' is not an object but a string
      id: json['id'],
    );
  }
}
