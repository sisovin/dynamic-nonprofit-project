class Donation {
  double amount;
  String donor;
  String campaign;
  DateTime date;
  bool anonymous;

  Donation({
    required this.amount,
    required this.donor,
    required this.campaign,
    required this.date,
    required this.anonymous,
  });

  factory Donation.fromJson(Map<String, dynamic> json) {
    return Donation(
      amount: json['amount'].toDouble(),
      donor: json['donor'],
      campaign: json['campaign'],
      date: DateTime.parse(json['date']),
      anonymous: json['anonymous'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'donor': donor,
      'campaign': campaign,
      'date': date.toIso8601String(),
      'anonymous': anonymous,
    };
  }
}
