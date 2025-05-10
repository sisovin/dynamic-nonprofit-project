import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../widgets/donation_form.dart';
import '../widgets/animated_progress_bar.dart';
import '../services/donation_service.dart';

class DonatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DonationService(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Donate'),
          backgroundColor: AppConstants.primaryColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Make a Donation',
                style: AppConstants.heading1,
              ),
              SizedBox(height: 16.0),
              DonationForm(),
              SizedBox(height: 16.0),
              Text(
                'Donation Progress',
                style: AppConstants.heading2,
              ),
              SizedBox(height: 8.0),
              Consumer<DonationService>(
                builder: (context, donationService, child) {
                  return AnimatedProgressBar(
                    progress: donationService.progress,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
