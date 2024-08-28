import 'package:flutter/material.dart';

class Cutomcolum extends StatelessWidget {
  const Cutomcolum({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 50,
        ),
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        Text(
          "Welcome to Job Mingle",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Text(
          "Job Mingle is a cutting-edge job portal application designed to bridge the gap between job seekers and employers. Our platform offers a seamless and user-friendly experience, enabling job seekers to find their dream jobs and employers to discover the right talent.",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        Text(
          "Our Mission",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "At Job Mingle, our mission is to simplify the job search process and create meaningful connections between candidates and employers. We believe in empowering individuals to pursue their career aspirations and helping businesses find the right people to drive their success.",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        Text(
          "Why Choose Job Mingle?",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "- Advanced job matching algorithms to connect you with the most relevant opportunities.",
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "- Easy-to-use interface for quick and efficient job searching.",
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "- Comprehensive employer profiles to help you make informed decisions.",
          style: TextStyle(fontSize: 18),
        ),
        Text(
          "- Real-time notifications for job alerts and application updates.",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
        Text(
          "Join Us Today!",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Whether you're a job seeker or an employer, Job Mingle is here to support you every step of the way. Join our community today and take the first step towards achieving your goals.",
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
