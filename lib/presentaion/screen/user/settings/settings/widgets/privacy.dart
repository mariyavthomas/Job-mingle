import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<Privacy> createState() => _PrivacyState();
}

class _PrivacyState extends State<Privacy> {
  // Updated URL for the Privacy Policy
  final String _url1 =
      'https://www.freeprivacypolicy.com/live/2424b682-9a96-451e-873d-be9c6df04ac4';

  Future<void> _launchURLTermsandCondition() async {
    final Uri url = Uri.parse(_url1);

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode
            .externalApplication, // Ensures the URL opens in a browser
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $_url1')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.privacy_tip, color: Colors.grey),
        TextButton(
          onPressed: _launchURLTermsandCondition,
          child: Text(
            "Privacy Policy",
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 48, 48, 48),
            ),
          ),
        ),
      ],
    );
  }
}
