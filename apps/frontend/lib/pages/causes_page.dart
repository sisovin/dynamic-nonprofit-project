import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/campaign.dart';
import '../services/api_service.dart';
import '../widgets/campaign_card.dart';

class CausesPage extends StatefulWidget {
  @override
  _CausesPageState createState() => _CausesPageState();
}

class _CausesPageState extends State<CausesPage> {
  List<Campaign> _campaigns = [];
  List<Campaign> _filteredCampaigns = [];
  int _currentPage = 1;
  bool _isLoading = false;
  String _filter = '';

  @override
  void initState() {
    super.initState();
    _fetchCampaigns();
  }

  Future<void> _fetchCampaigns() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final campaigns = await Provider.of<ApiService>(context, listen: false).fetchCampaigns(_currentPage);
      setState(() {
        _campaigns.addAll(campaigns);
        _filteredCampaigns = _campaigns;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // Handle error
    }
  }

  void _filterCampaigns(String filter) {
    setState(() {
      _filter = filter;
      _filteredCampaigns = _campaigns.where((campaign) {
        return campaign.title.toLowerCase().contains(filter.toLowerCase());
      }).toList();
    });
  }

  void _loadMoreCampaigns() {
    if (!_isLoading) {
      setState(() {
        _currentPage++;
      });
      _fetchCampaigns();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Causes'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Filter campaigns',
                border: OutlineInputBorder(),
              ),
              onChanged: _filterCampaigns,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
              ),
              itemCount: _filteredCampaigns.length,
              itemBuilder: (context, index) {
                if (index == _filteredCampaigns.length - 1 && !_isLoading) {
                  _loadMoreCampaigns();
                }
                return CampaignCard(campaign: _filteredCampaigns[index]);
              },
            ),
          ),
          if (_isLoading)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
