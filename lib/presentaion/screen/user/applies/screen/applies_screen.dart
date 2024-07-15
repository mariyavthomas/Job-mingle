import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobmingle/application/applyjob/applyjob_bloc.dart';
import 'package:jobmingle/presentaion/screen/user/applies/widgets/applyjobs.dart';
import 'package:jobmingle/utils/customcolor.dart';

class AppliesScreen extends StatefulWidget {
  const AppliesScreen({super.key});

  @override
  State<AppliesScreen> createState() => _AppliesScreenState();
}


class _AppliesScreenState extends State<AppliesScreen> {
   @override
  void initState() {
    super.initState();
    context.read<ApplyjobBloc>().add(LoadAppliedJobs());
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    
    return Scaffold(
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
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active)),
          ],
        ),
      ),
      body: ApplyJobs(height: height, width: width),
    );
  }
}

