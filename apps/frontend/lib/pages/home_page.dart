import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';
import '../constants/app_constants.dart';
import '../models/campaign.dart';
import '../services/api_service.dart';
import '../widgets/stats_counter.dart';
import '../widgets/volunteer_cta.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstants.appName),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeroCarousel(),
            FeaturedCampaignsSection(),
            StatsCounterAnimation(),
            VolunteerCTASection(),
          ],
        ),
      ),
    );
  }
}

class HeroCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: [1, 2, 3, 4, 5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Text(
                'text $i',
                style: TextStyle(fontSize: 16.0),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class FeaturedCampaignsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Campaign>>(
      future: Provider.of<ApiService>(context, listen: false).fetchFeaturedCampaigns(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No featured campaigns available.');
        } else {
          return Column(
            children: snapshot.data!.map((campaign) {
              return ListTile(
                title: Text(campaign.title),
                subtitle: Text(campaign.description),
                leading: Image.network(campaign.image),
              );
            }).toList(),
          );
        }
      },
    );
  }
}

class StatsCounterAnimation extends StatefulWidget {
  @override
  _StatsCounterAnimationState createState() => _StatsCounterAnimationState();
}

class _StatsCounterAnimationState extends State<StatsCounterAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppConstants.mediumAnimationDuration,
      vsync: this,
    );
    _animation = IntTween(begin: 0, end: 1000).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Total Donations',
          style: AppConstants.heading2,
        ),
        Text(
          '${_animation.value}',
          style: AppConstants.heading1,
        ),
      ],
    );
  }
}

class VolunteerCTASection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: AppConstants.primaryColor,
      child: Column(
        children: [
          Text(
            'Join Us as a Volunteer!',
            style: AppConstants.heading2.copyWith(color: Colors.white),
          ),
          SizedBox(height: 8.0),
          Text(
            'Make a difference in your community by volunteering with us.',
            style: AppConstants.bodyText.copyWith(color: Colors.white),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              // Navigate to volunteer sign-up page
            },
            child: Text('Sign Up Now'),
          ),
        ],
      ),
    );
  }
}
