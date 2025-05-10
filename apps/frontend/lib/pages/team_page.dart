import 'package:flutter/material.dart';
import '../models/team_member.dart';
import '../services/api_service.dart';
import '../constants/app_constants.dart';

class TeamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Our Team'),
      ),
      body: FutureBuilder<List<TeamMember>>(
        future: ApiService().fetchTeamMembers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No team members available.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final teamMember = snapshot.data![index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(teamMember.image),
                  ),
                  title: Text(teamMember.name),
                  subtitle: Text(teamMember.position),
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return TeamMemberDetailView(teamMember: teamMember);
                      },
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

class TeamMemberDetailView extends StatelessWidget {
  final TeamMember teamMember;

  TeamMemberDetailView({required this.teamMember});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(teamMember.image),
              ),
              SizedBox(width: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    teamMember.name,
                    style: AppConstants.heading1,
                  ),
                  Text(
                    teamMember.position,
                    style: AppConstants.heading2,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(
            teamMember.bio,
            style: AppConstants.bodyText,
          ),
          SizedBox(height: 16.0),
          Text(
            'Social Links',
            style: AppConstants.heading2,
          ),
          SizedBox(height: 8.0),
          Wrap(
            spacing: 8.0,
            children: teamMember.socialLinks.entries.map((entry) {
              return IconButton(
                icon: Icon(_getSocialIcon(entry.key)),
                onPressed: () {
                  // Open social link
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  IconData _getSocialIcon(String platform) {
    switch (platform) {
      case 'facebook':
        return Icons.facebook;
      case 'twitter':
        return Icons.twitter;
      case 'linkedin':
        return Icons.linkedin;
      case 'instagram':
        return Icons.instagram;
      default:
        return Icons.link;
    }
  }
}
