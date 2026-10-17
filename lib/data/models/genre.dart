class Genre {
  final String id;
  final String name;
  final String icon;

  const Genre({required this.id, required this.name, required this.icon});

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json['id'] as String,
        name: json['name'] as String,
        icon: json['icon'] as String,
      );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'icon': icon};
}
