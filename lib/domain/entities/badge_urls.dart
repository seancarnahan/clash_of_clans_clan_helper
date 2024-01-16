
import 'dart:convert';

class BadgeUrls {
  final String small;
  final String large;
  final String medium;

  BadgeUrls({
    required this.small,
    required this.large,
    required this.medium,
  });

  factory BadgeUrls.fromJson(Map<String, dynamic> json) {
    return BadgeUrls(
      small: json['small'],
      large: json['large'],
      medium: json['medium'],
    );
  }

  static String toJson(BadgeUrls badgeUrls) {
    Map<String, dynamic> badgeUrlsMap = {
      'small': badgeUrls.small,
      'large': badgeUrls.large,
      'medium': badgeUrls.medium,
    };
    return jsonEncode(badgeUrlsMap);
  }
}
