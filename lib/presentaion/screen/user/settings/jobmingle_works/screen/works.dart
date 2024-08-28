import 'package:flutter/material.dart';
import 'package:jobmingle/presentaion/screen/user/settings/jobmingle_works/widgets/works_widgets.dart';

class JobMingleWorks extends StatelessWidget {
  JobMingleWorks({super.key});

  final List<Map<String, dynamic>> content = [
    {
      "title": "User Registration and Profile Setup",
      "description": [
        "Job seekers create an account and fill in their profiles with personal details, work experience, education, skills, and career preferences.",
        "Employers or recruiters also create accounts to post job openings and browse candidate profiles."
      ]
    },
    {
      "title": "Job Search",
      "description": [
        "Users can search for jobs using various filters such as industry, job title, location, salary range, and more.",
        "JobMingle matches job seekers with relevant job postings based on their profile information and search criteria."
      ]
    },
    {
      "title": "Application Process",
      "description": [
        "Job seekers can apply directly through the platform by submitting their resumes and cover letters.",
        "Some platforms might also offer the option to apply with a one-click application or a pre-filled application form."
      ]
    },
    {
      "title": "Employer Interaction",
      "description": [
        "Employers can browse candidate profiles, filter them based on various criteria, and invite suitable candidates for interviews.",
        "Both employers and job seekers can communicate through the platform's messaging system."
      ]
    },
    {
      "title": "Job Alerts and Recommendations",
      "description": [
        "JobMingle may send notifications or emails to job seekers about new job postings that match their profiles.",
        "Personalized job recommendations can be provided based on the user's activity and preferences."
      ]
    },
    {
      "title": "Tracking and Analytics",
      "description": [
        "Job seekers can track the status of their applications, view the jobs they've applied to, and receive feedback from employers.",
        "Employers can track the number of applications, view candidate analytics, and manage the recruitment process."
      ]
    },
    {
      "title": "Additional Features",
      "description": [
        "Some platforms might offer resume-building tools, interview preparation tips, company reviews, or salary insights.",
        "Users may also have access to networking opportunities or career advice forums."
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
          ),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'How JobMingle Works',
              style: TextStyle(fontSize: 22),
            ),
          ),
          Cutomworks(content: content),
        ],
      ),
    );
  }
}

