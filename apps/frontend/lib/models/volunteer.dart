class Volunteer {
  String name;
  String email;
  String phone;
  String skills;
  String availability;

  Volunteer({
    required this.name,
    required this.email,
    required this.phone,
    required this.skills,
    required this.availability,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) {
    return Volunteer(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      skills: json['skills'],
      availability: json['availability'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'skills': skills,
      'availability': availability,
    };
  }
}
