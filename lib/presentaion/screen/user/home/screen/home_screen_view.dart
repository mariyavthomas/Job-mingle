import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:jobmingle/application/auth_user/loginauth_bloc.dart';
import 'package:jobmingle/application/profilef/profile/profile_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/home/widgets/Category.dart';
import 'package:jobmingle/utils/customcolor.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey();
  Position? position;

  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(GetUserEvent());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    Color primaryColor = CustomColor.bluelight(); // Primary color
    Color secondaryColor = Colors.grey[200]!; //
    return SafeArea(
      child: Scaffold(
        backgroundColor:primaryColor,
        drawer: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoaedState) {
              return Drawer(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      SizedBox(height: 10),
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: const Color.fromARGB(255, 229, 226, 226),
                          size: 40,
                        ),
                      ),
                      SizedBox(height: 5),
                      Column(
                        children: [
                          Text(state.user.name!.toUpperCase(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18)),
                          SizedBox(height: 5),
                          Text(state.user.email!,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text('Sign Out',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)),
                          Spacer(),
                          IconButton(
                            onPressed: () {
                              _showLogoutDialog(context);
                            },
                            icon: Icon(Icons.logout),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
            return Text('');
          },
        ),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.08),
          child: AppBar(
            backgroundColor: CustomColor.bluecolor(),
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.02),
                Container(
                  height: height * 0.045,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: height * 0.008,
                        vertical: height * 0.008,
                      ),
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                    ),
                    onSubmitted: (query) {
                      // Handle the search query here
                      print('Search query: $query');
                    },
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.notifications_active)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Recommended for You',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              SizedBox(
                height: height * 0.3,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    JobCard(
                      title: 'Flutter Developer',
                      company: 'Tech Solutions',
                      location: 'New York, NY',
                      description: 'Experience with Flutter...',
                    ),
                    JobCard(
                      title: 'Backend Engineer',
                      company: 'Innovatech',
                      location: 'San Francisco, CA',
                      description: 'Experience with Node.js...',
                    ),
                    JobCard(
                      title: 'UI/UX Designer',
                      company: 'Creative Minds',
                      location: 'Remote',
                      description: 'Creative UI/UX designer...',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Popular Categories',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    CategoryCard(
                      icon: Icons.computer,
                      title: 'IT & Software',
                    ),
                    CategoryCard(
                      icon: Icons.business_center,
                      title: 'Business',
                    ),
                    CategoryCard(
                      icon: Icons.design_services,
                      title: 'Design',
                    ),
                    CategoryCard(
                      icon: Icons.health_and_safety,
                      title: 'Healthcare',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Logout'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Logout'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                _performLogout(context); // Perform the logout
              },
            ),
          ],
        );
      },
    );
  }

  void _performLogout(BuildContext context) {
    final authBloc = BlocProvider.of<LoginauthBloc>(context);
    authBloc.add(SignOutEvent());

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
