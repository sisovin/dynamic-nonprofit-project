class TeamMember {
  String name;
  String position;
  String bio;
  String image;
  Map<String, String> socialLinks;

  TeamMember({
    required this.name,
    required this.position,
    required this.bio,
    required this.image,
    required this.socialLinks,
  });

  factory TeamMember.fromJson(Map<String, dynamic> json) {
    return TeamMember(
      name: json['name'],
      position: json['position'],
      bio: json['bio'],
      image: json['image'],
      socialLinks: Map<String, String>.from(json['social_links']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'position': position,
      'bio': bio,
      'image': image,
      'social_links': socialLinks,
    };
  }
}
