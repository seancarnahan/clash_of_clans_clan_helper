class ClanSearchResult {
  final String name;
  final String tag;
  // Add other relevant fields for search results

  ClanSearchResult({required this.name, required this.tag});

  factory ClanSearchResult.fromJson(Map<String, dynamic> json) {
    return ClanSearchResult(
      name: json['name'],
      tag: json['tag'],
      // Initialize other fields
    );
  }
}