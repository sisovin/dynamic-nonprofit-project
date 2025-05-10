class Testimonial {
  String author;
  String role;
  String content;
  String image;
  int rating;

  Testimonial({
    required this.author,
    required this.role,
    required this.content,
    required this.image,
    required this.rating,
  });

  factory Testimonial.fromJson(Map<String, dynamic> json) {
    return Testimonial(
      author: json['author'],
      role: json['role'],
      content: json['content'],
      image: json['image'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'role': role,
      'content': content,
      'image': image,
      'rating': rating,
    };
  }
}
