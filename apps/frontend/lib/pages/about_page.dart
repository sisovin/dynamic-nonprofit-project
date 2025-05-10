import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../models/team_member.dart';
import '../services/api_service.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MissionVisionSection(),
            HistoryTimeline(),
            TeamMemberGrid(),
          ],
        ),
      ),
    );
  }
}

class MissionVisionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Mission',
            style: AppConstants.heading1,
          ),
          SizedBox(height: 8.0),
          Text(
            'To make the world a better place by helping those in need.',
            style: AppConstants.bodyText,
          ),
          SizedBox(height: 16.0),
          Text(
            'Our Vision',
            style: AppConstants.heading1,
          ),
          SizedBox(height: 8.0),
          Text(
            'A world where everyone has the opportunity to thrive.',
            style: AppConstants.bodyText,
          ),
        ],
      ),
    );
  }
}

class HistoryTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our History',
            style: AppConstants.heading1,
          ),
          SizedBox(height: 8.0),
          TimelineEvent(
            year: '2000',
            description: 'Founded with the mission to help those in need.',
          ),
          TimelineEvent(
            year: '2005',
            description: 'Expanded our reach to international communities.',
          ),
          TimelineEvent(
            year: '2010',
            description: 'Launched new programs to support education and healthcare.',
          ),
          TimelineEvent(
            year: '2020',
            description: 'Celebrated 20 years of making a difference.',
          ),
        ],
      ),
    );
  }
}

class TimelineEvent extends StatelessWidget {
  final String year;
  final String description;

  TimelineEvent({required this.year, required this.description});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          year,
          style: AppConstants.heading2,
        ),
        SizedBox(width: 8.0),
        Expanded(
          child: Text(
            description,
            style: AppConstants.bodyText,
          ),
        ),
      ],
    );
  }
}

class TeamMemberGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TeamMember>>(
      future: ApiService().fetchTeamMembers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No team members available.');
        } else {
          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
            ),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final teamMember = snapshot.data![index];
              return TeamMemberCard(teamMember: teamMember);
            },
          );
        }
      },
    );
  }
}

class TeamMemberCard extends StatelessWidget {
  final TeamMember teamMember;

  TeamMemberCard({required this.teamMember});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(teamMember.image),
          SizedBox(height: 8.0),
          Text(
            teamMember.name,
            style: AppConstants.heading2,
          ),
          Text(
            teamMember.position,
            style: AppConstants.bodyText,
          ),
        ],
      ),
    );
  }
}
