class Tip {
  final String title;
  final String description;

  Tip({
    required this.title,
    required this.description,
  });

  factory Tip.fromJson(Map<String, dynamic> json) {
    return Tip(
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
    };
  }
}
