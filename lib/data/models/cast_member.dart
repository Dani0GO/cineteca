class CastMember {
  final String name;
  final String role;
  final String photo;

  const CastMember({required this.name, required this.role, required this.photo});

  factory CastMember.fromJson(Map<String, dynamic> json) => CastMember(
        name: json['name'] as String,
        role: json['role'] as String,
        photo: json['photo'] as String,
      );

  Map<String, dynamic> toJson() => {'name': name, 'role': role, 'photo': photo};
}
