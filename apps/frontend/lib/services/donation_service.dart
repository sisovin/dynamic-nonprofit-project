import 'package:flutter/material.dart';
import '../models/donation.dart';
import '../services/api_service.dart';
import '../constants/app_constants.dart';

class DonationService with ChangeNotifier {
  double _progress = 0.0;
  double get progress => _progress;

  Future<void> processDonation(Donation donation) async {
    try {
      final response = await ApiService(baseUrl: AppConstants.apiBaseUrl).post('/donations/', donation.toJson());
      if (response['status'] == 'success') {
        _progress = response['progress'];
        notifyListeners();
      } else {
        throw Exception('Failed to process donation');
      }
    } catch (e) {
      throw Exception('Error processing donation: $e');
    }
  }

  Future<void> generateReceipt(Donation donation) async {
    try {
      final response = await ApiService(baseUrl: AppConstants.apiBaseUrl).post('/donations/receipt', donation.toJson());
      if (response['status'] != 'success') {
        throw Exception('Failed to generate receipt');
      }
    } catch (e) {
      throw Exception('Error generating receipt: $e');
    }
  }

  Future<void> validatePayment(Donation donation) async {
    try {
      final response = await ApiService(baseUrl: AppConstants.apiBaseUrl).post('/donations/validate', donation.toJson());
      if (response['status'] != 'success') {
        throw Exception('Failed to validate payment');
      }
    } catch (e) {
      throw Exception('Error validating payment: $e');
    }
  }
}
