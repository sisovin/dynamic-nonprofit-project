class Campaign {
  String title;
  String description;
  String image;
  double targetAmount;
  double raisedAmount;
  DateTime startDate;
  DateTime endDate;
  bool isFeatured;

  Campaign({
    required this.title,
    required this.description,
    required this.image,
    required this.targetAmount,
    required this.raisedAmount,
    required this.startDate,
    required this.endDate,
    required this.isFeatured,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      targetAmount: json['target_amount'].toDouble(),
      raisedAmount: json['raised_amount'].toDouble(),
      startDate: DateTime.parse(json['start_date']),
      endDate: DateTime.parse(json['end_date']),
      isFeatured: json['is_featured'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'target_amount': targetAmount,
      'raised_amount': raisedAmount,
      'start_date': startDate.toIso8601String(),
      'end_date': endDate.toIso8601String(),
      'is_featured': isFeatured,
    };
  }
}
