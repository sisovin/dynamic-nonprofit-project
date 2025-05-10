import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../services/donation_service.dart';
import '../models/donation.dart';

class DonationForm extends StatefulWidget {
  @override
  _DonationFormState createState() => _DonationFormState();
}

class _DonationFormState extends State<DonationForm> {
  final _formKey = GlobalKey<FormState>();
  final _amountController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  bool _isAnonymous = false;

  @override
  void dispose() {
    _amountController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final donation = Donation(
        amount: double.parse(_amountController.text),
        donorName: _isAnonymous ? 'Anonymous' : _nameController.text,
        donorEmail: _emailController.text,
        anonymous: _isAnonymous,
      );

      Provider.of<DonationService>(context, listen: false).processDonation(donation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _amountController,
            decoration: InputDecoration(labelText: 'Donation Amount'),
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a donation amount';
              }
              if (double.tryParse(value) == null) {
                return 'Please enter a valid number';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
            validator: (value) {
              if (!_isAnonymous && (value == null || value.isEmpty)) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address';
              }
              return null;
            },
          ),
          Row(
            children: [
              Checkbox(
                value: _isAnonymous,
                onChanged: (value) {
                  setState(() {
                    _isAnonymous = value!;
                  });
                },
              ),
              Text('Donate anonymously'),
            ],
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: _submitForm,
            child: Text('Donate'),
            style: ElevatedButton.styleFrom(
              primary: AppConstants.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
